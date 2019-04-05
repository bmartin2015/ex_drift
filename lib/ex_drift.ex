defmodule ExDrift do
  @moduledoc """
  Documentation for ExDrift.
  """
  @behaviour ExDrift.Backend

  @type conversation_id :: integer()
  @type config_opt :: any()

  @impl true
  @spec get_conversation(conversation_id, [config_opt]) :: {:ok, any()} | {:error, any()}
  def get_conversation(conversation_id, opts \\ []) do
    backend().get_conversation(conversation_id, opts)
  end

  defp backend() do
    ExDrift.DefaultBackend
  end
end
