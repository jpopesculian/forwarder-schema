require 'graphql'
require 'forwarder_models'
require 'server/client'

require_relative 'forwarder_schema/base/base_object'
require_relative 'forwarder_schema/base/base_scalar'
require_relative 'forwarder_schema/base/base_mutation'
require_relative 'forwarder_schema/base/field'

require_relative 'forwarder_schema/types/date_time_type'

require_relative 'forwarder_schema/types/text_type'

require_relative 'forwarder_schema/mutations/send_message_mutation'

require_relative 'forwarder_schema/fields/texts_field'
require_relative 'forwarder_schema/fields/send_message_field'
require_relative 'forwarder_schema/fields/message_fetched_field'

require_relative 'forwarder_schema/types/query_type'
require_relative 'forwarder_schema/types/mutation_type'
require_relative 'forwarder_schema/types/subscription_type'

require_relative 'forwarder_schema/schema'

require_relative 'forwarder_schema/start'
