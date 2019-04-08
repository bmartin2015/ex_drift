defmodule ExDrift.ResponseParser.Contact do
  @moduledoc false

  alias ExDrift.Contact

  @spec parse(term()) :: Contact.t()
  def parse(data) do
    data = data["data"]
    %Contact{
      id: data["id"],
      created_at: parse_datetime(data["createdAt"]),
      email: data["attributes"]["email"],
      name: data["attributes"]["name"],
      self_service: data["attributes"]["self_service"],
      account: data["attributes"]["account"],
      plan: data["attributes"]["plan"],
      raw: data
    }
  end

  defp parse_datetime(unix_timestamp) do
    DateTime.from_unix!(unix_timestamp, :millisecond)
  end
end
