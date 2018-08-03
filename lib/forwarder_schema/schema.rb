module ForwarderSchema
  class Schema < GraphQL::Schema
    use Subscriptions

    query Types::QueryType
    mutation Types::MutationType
    subscription Types::SubscriptionType
  end
end
