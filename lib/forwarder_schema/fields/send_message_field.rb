module ForwarderSchema
  module Fields
    module SendMessageField
      extend Field

      included do
        field :send_message, mutation: Mutations::SendMessageMutation
      end
    end
  end
end
