module ForwarderSchema
  module Types
    class DateTimeType < BaseScalar
      description "Holds a date and time"

      def self.coerce_input(value, _ctx)
        case value
        when String
          Time.parse(value)
        when Date
          value.to_time
        else
          value
        end
      end

      def self.coerce_result(value, _ctx)
        value = coerce_input(value, _ctx) unless value.is_a? Time
        value.utc.iso8601
      end
    end
  end
end
