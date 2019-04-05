defmodule ExDriftTest do
  use ExUnit.Case
  doctest ExDrift

  alias ExDrift.Conversation

  import Tesla.Mock

  setup do
    mock(fn
      %{method: :get, url: "https://driftapi.com/conversations/554477109"} ->
        %Tesla.Env{
          status: 200,
          body: %{
            "data" => %{
              "contactId" => 1_634_142_228,
              "createdAt" => 1_551_980_568_471,
              "id" => 554_477_109,
              "inboxId" => 25344,
              "participants" => [125_356, 256_003],
              "status" => "open"
            }
          }
        }
    end)

    :ok
  end

  test "request with HTTP 200 response" do
    assert {:ok, %Conversation{id: 554477109}} = ExDrift.get_conversation("554477109")
  end
end
