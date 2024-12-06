# frozen_string_literal: true

RSpec.describe Paytracer::SaleByTransactionResource do
  describe "#create" do
    it "creates a new sale transaction by transaction" do
      VCR.use_cassette("create sale by transaction") do
        client = Paytracer::Client.new(access_token: "<ACCESS_TOKEN>")
        client.sale.by_transaction.create(VALID_SALE_BY_TRANSACTION)
      end
    end
  end
end
