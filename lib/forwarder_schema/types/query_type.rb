module ForwarderSchema
  module Types
    class QueryType < GraphQL::Schema::Object
      description "The query root of this schema"

      include Fields::TextsField
    end
  end
end
