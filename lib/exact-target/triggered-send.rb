module ExactTarget
  class TriggeredSend
    def config
      ExactTarget.configuration
    end

    def send(template,email,attributes)
      call('CreateRequest', 
           params_for_triggered_send(template,email,attributes))
    end

    def call(endpoint, params = {})
      client.globals.soap_header("wsa:To" => "https://#{config.server}/Service.asmx",
                                 "wsa:Action" => endpoint)
      body = client.call(endpoint,
                         message: params,
                         :attributes => { :xmlns => NAMESPACE },
                         soap_action: nil)
      response = Map.new(body.to_hash.values.first)
    end

    def client
      unless @client
        @client = Savon.client do
          endpoint "https://#{config.server}/Service.asmx"
          namespace NAMESPACE
          env_namespace :soap
          log true
          wsse_auth config.username, config.password
          namespace_identifier :ns1
          namespaces NAMESPACES
        end
      end
      @client
    end

    protected

    def params_for_triggered_send(template,email,attributes = {})
      request = {
        'Options/' => nil,
        'Objects' => {
          'ObjectID/' => nil,
          'TriggeredSendDefinition' => {
            'ObjectID/' => nil,
            'CustomerKey' => template,
          },
          'Subscribers' => {
            'ObjectID/' => nil,
            'EmailAddress' => email,
            'SubscriberKey' => email,
            'Attributes!' => format_attributes(attributes)
          }
        },
        :attributes! => { 'Objects' => {"xsi:type" => 'TriggeredSend'}}
      }
    end

    def format_attributes(attributes)
      attributes.collect do |k,v|
        {'Name' => k, 'Value' => v}
      end
    end
  end
end
