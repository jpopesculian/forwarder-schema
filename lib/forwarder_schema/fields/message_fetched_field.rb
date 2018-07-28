module ForwarderSchema
  module Fields
    module MessageFetchedField
      extend Field

      included do
        field :message_fetched, Types::TextType, null: false do
          description "message was created"
          argument :number, String, required: true
        end
      end

      def message_fetched(args = {})
        true
      end
    end
  end
end
