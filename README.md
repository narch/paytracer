# Paytracer

Paytracer is a Ruby gem for interacting with the Paytracer API, providing a simple and intuitive interface for managing customers, transactions, and more.

https://developers.paytrace.com/

## Installation

Add this line to your application's Gemfile:

    gem "paytracer", github: "narch/paytracer.rb"

And then execute:

    $ bundle

## Usage

### Configuration

Before making any requests, you need to configure the gem with your credentials:

```ruby
# config/initializers/paytracer.rb
Paytracer.configure do |config|
  config.username = "YOUR_USERNAME"
  config.password = "YOUR_PASSWORD"
  config.integrator_id = "YOUR_INTEGRATOR_ID"
  # Optional, defaults to false
  config.sandbox = true
end
```

All additional requests will require an access token.

### Creating An Access Token

```ruby
response = Paytracer::AccessToken.create
token = response.access_token
```

### Creating A Client

```ruby
client = Paytracer::Client.new(access_token: token)
```

### Customers

```ruby
client.customers.create({})
client.customers.update({})
client.customers.delete(customer_id)
client.customers.export({})
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
