module ForwarderSchema
  class BaseMutation < GraphQL::Schema::Mutation
    def request
      context[:request]
    end
  end
end
