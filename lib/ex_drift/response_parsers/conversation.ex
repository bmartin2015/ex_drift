defmodule ExDrift.ResponseParser.Conversation do
  @moduledoc false

  alias ExDrift.Conversation

  @spec parse(term()) :: Conversation.t()
  def parse(data) do
    data = data["data"]
    %Conversation{
      contact_id: data["contactId"],
      id: data["id"],
      inbox_id: data["inboxId"],
      participants: data["participants"],
      status: data["status"],
      created_at: parse_datetime(data["createdAt"])
    }
  end

  defp parse_datetime(unix_timestamp) do
    DateTime.from_unix!(unix_timestamp, :millisecond)
  end
end
