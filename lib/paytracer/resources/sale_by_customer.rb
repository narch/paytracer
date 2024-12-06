# frozen_string_literal: true

module Paytracer
  class SaleByCustomerResource < Resource
    def create(attributes={})
      Response.new post_request("v1/transactions/sale/by_customer", body: attributes)
    end
  end
end
