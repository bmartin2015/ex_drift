defmodule ExDrift do
  @moduledoc """
  Documentation for ExDrift.
  """

  @type conversation_id :: integer()
  @type config_opt :: any()

  @spec get_conversation(conversation_id, [config_opt]) :: {:ok, any()} | {:error, any()}
  def get_conversation(conversation_id, opts \\ []) do
    backend().get_conversation(conversation_id, opts)
  end

  def get_contact(contact_id, opts \\ []) do
    backend().get_contact(contact_id, opts)
  end

  defp backend() do
    ExDrift.Backend
  end
end
