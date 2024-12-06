# frozen_string_literal: true

require "faraday"

module Paytracer
  class Client
    BASE_URL = "https://api.paytrace.com/"
    SANDBOX_BASE_URL = "https://api.sandbox.paytrace.com/"

    attr_reader :access_token

    def initialize(access_token: nil)
      @access_token = access_token
    end

    def connection
      @connection ||= Faraday.new do |conn|
        conn.url_prefix = url
        if @access_token.nil?
          conn.headers = { "Content-Type": "application/x-www-form-urlencoded; charset=UTF-8", }
        else
          conn.headers = { Authorization: "Bearer #{@access_token}" }
          conn.request :json
        end
        conn.response :json, content_type: "application/json"
        conn.adapter Faraday.default_adapter
      end
    end

    def url
      SANDBOX_BASE_URL
      #Paytracer.configuration.sandbox ? SANDBOX_BASE_URL : BASE_URL
    end

    def customer
      CustomerResource.new(self)
    end

    def sale
      SaleResource.new(self)
    end
  end
end
