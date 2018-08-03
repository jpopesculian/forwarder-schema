# frozen_string_literal: true
module ForwarderSchema
  class Subscriptions < GraphQL::Subscriptions

    attr_accessor :pipe

    def initialize(**rest)
      # A per-process map of subscriptions to deliver.
      # This is provided by Rails, so let's use it
      @id = rand(0..1000)
      @subscriptions = Concurrent::Map.new
      @connections = Concurrent::Map.new
      Utils::Pipe.configure(self)
      super
    end

    # An event was triggered; Push the data over ActionCable.
    # Subscribers will re-evaluate locally.
    def execute_all(event, object)
      pipe.send event.topic, object
    end

    # This subscription was re-evaluated.
    # Send it to the specific stream where this client was waiting.
    def deliver(subscription_id, result)
      connection = @connections[subscription_id]
      return if connection.nil?
      connection.transmit(result)
    end

    # A query was run where these events were subscribed to.
    # Store them in memory in _this_ ActionCable frontend.
    # It will receive notifications when events come in
    # and re-evaluate the query locally.
    def write_subscription(query, events)
      subscription_id = query.context[:subscription_id] ||= build_id
      connection = query.context.fetch(:connection)
      @subscriptions[subscription_id] = query
      @connections[subscription_id] = connection

      events.each do |event|
        pipe.receive subscription_id, event.topic do |object|
          execute(subscription_id, event, object)
        end
      end
    end

    # Return the query from "storage" (in memory)
    def read_subscription(subscription_id)
      query = @subscriptions[subscription_id]
      {
        query_string: query.query_string,
        variables: query.provided_variables,
        context: query.context.to_h,
        operation_name: query.operation_name,
      }
    end

    # The channel was closed, forget about it.
    def delete_subscription(subscription_id)
      @subscriptions.delete(subscription_id)
      @connections.delete(subscription_id).close
    end
  end
end
