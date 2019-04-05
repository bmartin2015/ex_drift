defmodule ExDrift.DefaultBackend do
  @moduledoc false

  alias ExDrift.ResponseParser.Conversation

  @behaviour ExDrift.Backend

  @type conversation_id :: ExDrift.conversation_id()
  @type config_opt :: ExDrift.config_opt()


  @impl true
  @spec get_conversation(conversation_id, [config_opt]) :: {:ok, any()} | {:error, any()}
  def get_conversation(conversation_id, _opts) do
    build_client()
    |> Tesla.get("/conversations/#{conversation_id}")
    |> response()
  end

  defp response({:ok, %{status: 200, body: body}}), do: {:ok, Conversation.parse(body)}
  defp response({:ok, %{status: status}}), do: {:error, "HTTP Status #{status}"}
  defp response({:error, response}), do: {:error, response}

  @spec build_client() :: Tesla.Client.t()
  def build_client do
    middleware = [
      {Tesla.Middleware.BaseUrl, "https://driftapi.com"},
      Tesla.Middleware.JSON,
      {Tesla.Middleware.Headers,
       [
         {"authorization", "token " <> get_from_env(:drift_auth_token, "")},
         {"accept", "application/json"}
       ]}
    ]

    adapter = get_adapter_from_env()

    Tesla.client(middleware, adapter)
  end

  defp get_from_env(key, default) do
    Application.get_env(:ex_drift, key, default)
  end

  defp get_adapter_from_env do
    Application.get_env(:tesla, :adapter, {Tesla.Adapter.Hackney, [recv_timeout: 30_000]})
  end
end
