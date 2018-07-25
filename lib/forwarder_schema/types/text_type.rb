module ForwarderSchema
  module Types
    class TextType < BaseObject
      description "A Text Message"

      field :id, ID, null: false
      field :twilio_id, String, null: true
      field :received_time, DateTimeType, null: true
      field :sent_time, DateTimeType, null: true
      field :from, String, null: true
      field :to, String, null: true
      field :body, String, null: true
    end
  end
end
