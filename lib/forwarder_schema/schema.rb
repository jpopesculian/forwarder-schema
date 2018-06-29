module ForwarderSchema
  class Schema < GraphQL::Schema
    query Types::QueryType
  end
end
