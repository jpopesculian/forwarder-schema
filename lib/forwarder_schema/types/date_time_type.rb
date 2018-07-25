module ForwarderSchema
  module Types
    class DateTimeType < BaseScalar
      description "Holds a date and time"

      def self.coerce_input(value, _ctx)
        Time.zone.parse(value)
      end

      def self.coerce_result(value, _ctx)
        value.utc.iso8601
      end
    end
  end
end
