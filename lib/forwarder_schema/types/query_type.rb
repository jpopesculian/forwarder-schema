module ForwarderSchema
  module Types
    class QueryType < BaseObject
      description "The query root of this schema"

      include Fields::TextsField
    end
  end
end
