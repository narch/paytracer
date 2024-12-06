# frozen_string_literal: true

require "uri"

module Paytracer
  class AccessToken
    def self.create(**options)
      username, password = set_credentials(options)
      attributes = {
        grant_type: "password",
        username: username,
        password: password
      }

      handle_response Client.new.connection.post("oauth/token", URI.encode_www_form(attributes))
    end

    def self.set_credentials(options = {})
      if options.any?
        username = options[:username] if options.key?(:username)
        password = options[:password] if options.key?(:password)
      end 
      username = Paytracer.configuration.username if !username
      password = Paytracer.configuration.password if !password

      [username, password]
    end

    def self.handle_response(response)
      case response.status
      when 200, 201
        # Convert the response body into a Paytracer::Object
        Paytracer::Object.new(response.body)
      when 400..451
        # Raise an error for client-side issues
        raise Error, "#{response.body['error']} - #{response.body['error_description']}"
      else
        # Raise a generic error for server-side problems
        raise Error, "We were unable to perform the request due to server-side problems."
      end
    end    
  end
end
