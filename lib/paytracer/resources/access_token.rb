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
      return response.body if [200, 201].include?(response.status)
      if (400..451).include?(response.status)
        raise Error, "#{response.body["error"]} - #{response.body["error_description"]}"
      else 
        raise Error, "We were unable to perform the request due to server-side problems."
      end
    end
  end
end
