require 'testing'
require 'exact-target'

Testing ExactTarget do
  testing 'Has a version' do
    assert{ ExactTarget::VERSION }
  end
end

