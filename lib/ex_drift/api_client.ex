defmodule ExDrift.ApiClient do
  @moduledoc false

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
