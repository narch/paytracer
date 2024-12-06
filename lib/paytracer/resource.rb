# frozen_string_literal: true

module Paytracer
  class Resource
    attr_reader :client

    def initialize(client)
      @client = client
    end

    protected

    # The current Paytrace API only supports POST requests

    def post_request(url, body:, headers: {})
      # Include integrator_id in the body if it's provided in the configuration
      body[:integrator_id] = Paytracer.configuration.integrator_id if Paytracer.configuration.integrator_id && !body.key?(:integrator_id)
      handle_response client.connection.post(url, body, headers)
    end

    def handle_response(response)
      case response.status
      when 400
        raise Error, "Your request was malformed. #{response.body["error"]}"
      when 401
        raise Error, "You did not supply valid authentication credentials. #{response.body["error"]}"
      when 403
        raise Error, "You are not allowed to perform that action. #{response.body["error"]}"
      when 404
        raise Error, "No results were found for your request. #{response.body["error"]}"
      when 429
        raise Error, "Your request exceeded the API rate limit. #{response.body["error"]}"
      when 500
        raise Error, "We were unable to perform the request due to server-side problems. #{response.body["error"]}"
      when 503
        raise Error, "You have been rate limited for sending more than 20 requests per second. #{response.body["error"]}"
      end

      response.body
    end
  end
end
