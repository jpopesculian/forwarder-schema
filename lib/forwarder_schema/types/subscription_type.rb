module ForwarderSchema
  module Types
    class SubscriptionType < BaseObject
      description "The subscription root of this schema"

      include Fields::MessageFetchedField
    end
  end
end
