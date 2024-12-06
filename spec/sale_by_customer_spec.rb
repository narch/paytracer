# frozen_string_literal: true

RSpec.describe Paytracer::SaleByCustomerResource do
  describe "#create" do
    it "creates a new sale transaction by customer" do
      VCR.use_cassette("create sale by customer") do
        client = Paytracer::Client.new(access_token: "<ACCESS_TOKEN>")
        client.sale.by_customer.create(VALID_SALE_BY_CUSTOMER)
      end
    end
  end
end
