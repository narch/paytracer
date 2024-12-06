# frozen_string_literal: true

module Paytracer
  class SaleByTransactionResource < Resource
    def create(attributes={})
      Response.new post_request("v1/transactions/sale/by_transaction", body: attributes)
    end
  end
end 
