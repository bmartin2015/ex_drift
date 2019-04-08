defmodule ExDrift.Contact do
  @moduledoc """
  A Drift Contact
  """

  @type id :: integer()
  @type status :: String.t()
  @type created_at :: DateTime.t()

  @type t :: %__MODULE__{
    id: id(),
    created_at: DateTime.t(),
    email: String.t(),
    name: String.t(),
    self_service: boolean(),
    account: String.t(),
    plan: String.t(),
    raw: term()
  }

  defstruct [
    :id,
    :created_at,
    :email,
    :name,
    :self_service,
    :account,
    :plan,
    :raw
  ]
end
