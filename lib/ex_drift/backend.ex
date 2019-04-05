defmodule ExDrift.Backend do
  @moduledoc false

  @type conversation_id :: ExDrift.conversation_id()
  @type config_opt :: ExDrift.config_opt()

  @callback get_conversation(conversation_id, [config_opt]) ::
              {:ok, any()} | {:error, any()}
end
