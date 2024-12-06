# frozen_string_literal: true

module Paytracer
  class KeyedSaleResource < Resource
    def create(attributes={})
      Response.new post_request("v1/transactions/sale/keyed", body: attributes)
    end
  end
end