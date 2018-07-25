module ForwarderSchema
  module Fields
    module TextsField
      extend Field

      included do
        field :texts, [Types::TextType], null: true do
          description "Get a list of texts"
        end
      end

      def texts
        Models::Text.all
      end
    end
  end
end
