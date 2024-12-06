# frozen_string_literal: true

RSpec.describe Paytracer::KeyedSaleResource do
  describe "#create" do
    it "creates a new sale transaction" do
      VCR.use_cassette("create keyed sale transaction") do
        client = Paytracer::Client.new(access_token: "<ACCESS_TOKEN>")
        client.sale.keyed.create(VALID_KEYED_SALE)
      end
    end
  end
end

