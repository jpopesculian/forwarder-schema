module ForwarderSchema
  module Mutations
    class SendMessageMutation < BaseMutation
      null true
      description "Send a Text Message"

      argument :number, String, required: true
      argument :body, String, required: true

      field :text, Types::TextType, null: false

      def resolve(number:, body:)
        command = Server::Client::SmsSend.(
          body: body,
          to: number,
          from: '+14158542955'
        )
        {
          text: Models::Text.new(
            id: command.sms_id,
            to: :number,
            body: :body
          )
        }
      end
    end
  end
end
