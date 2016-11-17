# https://www.rubytapas.com/2012/10/19/episode-012-fetch-for-defaults/

#######################################################################################

auth = {
  'uid'   => 12345,
  'info'  => {}
}

email_address = auth['info'].fetch('email')
# => KeyError: key not found: "email"

#######################################################################################

auth['uid'] # => 12345
auth['info'].fetch('email') do
  raise "Invalid auth data (missing email)."\
        "See https://github.com/intridea/omniauth/wiki/Auth-Hash-Schema"
end
email_address = auth['info'].fetch('email')
# => RuntimeError: Invalid auth data (missing email).See https://github.com/intridea/omniauth/wiki/Auth-Hash-Schema

#######################################################################################

email_address = auth['info'].fetch('email') { 'anonymous@example.org' }
email_address # => "anonymous@example.org"

#######################################################################################

require 'logger'

class NullLogger
  def method_missing(*); end
end

options = {}
logger = options[:logger] || Logger.new($stdout)

unless logger
  logger = NullLogger.new
end

logger

# => #<Logger:0x00556944457740
#     @progname=nil,
#     @level=0,
#     @default_formatter=
#       #<Logger::Formatter:0x00556944457628 @datetime_format=nil>,
#       @formatter=nil,
#       @logdev=#<Logger::LogDevice:0x00556944457560 @shift_size=nil, @shift_age=nil, @filename=nil, @dev=#<IO:<STDOUT>>,
#       @mutex=#<Logger::LogDevice::LogDeviceMutex:0x00556944457510 @mon_owner=nil, @mon_count=0, @mon_mutex=#<Mutex:0x00556944457330>>>>

#######################################################################################

options = { logger: false }
logger = options[:logger] || Logger.new($stdout)

unless logger
  logger = NullLogger.new
end

logger

# => #<Logger:0x00556944457740
#     @progname=nil,
#     @level=0,
#     @default_formatter=
#       #<Logger::Formatter:0x00556944457628 @datetime_format=nil>,
#       @formatter=nil,
#       @logdev=#<Logger::LogDevice:0x00556944457560 @shift_size=nil, @shift_age=nil, @filename=nil, @dev=#<IO:<STDOUT>>,
#       @mutex=#<Logger::LogDevice::LogDeviceMutex:0x00556944457510 @mon_owner=nil, @mon_count=0, @mon_mutex=#<Mutex:0x00556944457330>>>>

#######################################################################################

{}[:foo] || :default              # => :default
{ foo: nil }[:foo] || :default    # => :default
{ foo: false }[:foo] || :default  # => :default

#######################################################################################

{}.fetch(:foo) { :default }             # => :default
{ foo: nil }.fetch(:foo){ :default }    # => nil
{ foo: false }.fetch(:foo){ :default }  # => false

#######################################################################################

options = { logger: false }
logger  = options.fetch(:logger){ Logger.new($stdout) }

unless logger
  logger = NullLogger.new
end

logger
# => #<NullLogger:0x00000003b73858>
