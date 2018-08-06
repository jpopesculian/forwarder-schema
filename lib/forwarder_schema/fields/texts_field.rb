module ForwarderSchema
  module Fields
    module TextsField
      extend Field

      included do
        field :texts, [Types::TextType], null: true do
          description "Get a list of texts"
          argument :number, String, required: false
        end
      end

      def texts(number: nil)
        Models::Queries::TextByContact.(number)
      end
    end
  end
end
