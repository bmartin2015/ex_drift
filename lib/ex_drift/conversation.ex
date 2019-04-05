defmodule ExDrift.Conversation do
  @moduledoc """
  A Drift Conversation
  """

  @type id :: integer()
  @type status :: String.t()
  @type created_at :: DateTime.t()

  @type t :: %__MODULE__{
    contact_id: id(),
    created_at: created_at(),
    id: id(),
    inbox_id: id(),
    participants: [id()],
    status: status()

  }

  defstruct [
    :contact_id,
    :created_at,
    :id,
    :inbox_id,
    :participants,
    :status
  ]
end
