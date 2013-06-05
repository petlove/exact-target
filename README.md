# Exact::Target

This Gem provides an interface to ExactTarget's TriggeredSend API.

## Installation

Add this line to your application's Gemfile:

    gem 'exact-target'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install exact-target

## Usage

ExactTarget's API isn't exactly SOAP. It is SOAP-like, however if you
actually use the WDSL, it provides invalid endpoints. In addition the XML
formats required could be describe as *interesting* and can be quite
fragile.

This gem endeavors to take some of the pain out of the process of
sending triggered email.

### Configuration

```ruby
ExactTarget.configure do |config|
  config.username = 'test'
  config.password = 'test'
  config.server = 'webservice.exacttarget.com'
end
```

`server` is the ExactTarget server your account is assigned to,
usually one of `webservice.exacttarget.com`,
`webservice.s4.exacttarget.com` or `webservice.s6.exacttarget.com`

### Triggering an Email

```ruby
trigger = ExactTarget::TriggeredSend.new
template = 42            # The template ID from the ExactTarget web interface
email = 'foo@example.com # Recipient
# The keys of the attributes hash are the name of the variables in the
# ExactTarget template
attributes = {
  'Subject'=> '...',
  'Email Address' => '...',
  'First Name' => '...',
  'Last Name' => '...',
  'MobilePhone' => '...',
  'Message' => '...'
}
trigger.send(template,email,attributes)
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
