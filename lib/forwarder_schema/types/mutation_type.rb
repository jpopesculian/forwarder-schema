module ForwarderSchema
  module Types
    class MutationType < BaseObject
      description "The query mutation of this schema"

      include Fields::SendMessageField
    end
  end
end
