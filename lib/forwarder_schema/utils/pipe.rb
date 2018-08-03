module ForwarderSchema
  module Utils
    class Pipe
      def self.configure(receiver, attr_name: nil)
        attr_name ||= :pipe
        instance = build
        receiver.public_send("#{attr_name}=", instance)
      end

      def self.build
        instance = new
        instance.configure
        instance
      end

      def configure
        @channel, @exchange = connect(
          Settings.build('settings/rabbitmq.json').get.symbolize_keys
        )
        @serializer = JSON
      end

      def send(channel_key, message = {})
        exchange.publish serializer.dump(message), routing_key: channel_key
      end

      def receive(id, channel_key, &block)
        channel
          .queue("#{id}:#{channel_key}")
          .bind(exchange, routing_key: channel_key)
          .subscribe do |delivery_info, properties, payload|
            block.call(serializer.load(payload))
          end
      end

      private

      attr_reader :exchange
      attr_reader :channel
      attr_reader :serializer

      def connect(settings)
        connection = Bunny.new(settings)
        connection.start
        channel = connection.create_channel
        exchange = channel.topic("graphql-events")
        return channel, exchange
      end
    end
  end
end
