module ForwarderSchema
  class Schema < GraphQL::Schema
    query Types::QueryType
    mutation Types::MutationType
  end
end
