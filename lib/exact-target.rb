require "exact-target/version"
require "exact-target/triggered-send"

module ExactTarget
  NAMESPACE = 'http://exacttarget.com/wsdl/partnerAPI'
  NAMESPACES = {
    "xmlns:wsa" => "http://schemas.xmlsoap.org/ws/2004/08/addressing",
  }

  class << self
    attr_accessor :configuration
  end

  def self.configure
    self.configuration ||= Configuration.new
    yield(configuration)
  end

  class Configuration
    attr_accessor :username, :password, :server
  end
end
