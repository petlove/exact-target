require 'testing'
require 'exact-target'

Testing ExactTarget do
  testing 'Has a version' do
    assert{ ExactTarget::VERSION }
  end

  testing 'Can be configured' do
    ExactTarget.configure do |config|
      config.username = 'test'
      config.password = 'test'
      config.server = 'webservice.exacttarget.com'
    end
    assert { ExactTarget.configuration }
  end

end

