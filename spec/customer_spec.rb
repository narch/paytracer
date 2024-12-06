# frozen_string_literal: true

RSpec.describe Paytracer::CustomerResource do
  describe "#create" do
    it "creates a new customer" do
      VCR.use_cassette("create new customer") do
        client = Paytracer::Client.new(access_token: "<ACCESS_TOKEN>")
        client.customer.create(VALID_CUSTOMER)
      end
    end
  end
end