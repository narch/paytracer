# frozen_string_literal: true

module Paytracer
  class Configuration
    attr_accessor :username, :password, :integrator_id, :sandbox

    def initialize(username: nil, password: nil, integrator_id: nil, sandbox: false)
      @username = username
      @password = password
      @integrator_id = integrator_id
      @sandbox = sandbox
    end
  end
end
