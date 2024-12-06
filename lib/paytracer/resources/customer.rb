# frozen_string_literal: true

require "uri"

module Paytracer
  class CustomerResource < Resource
    def create(attributes={})
      Response.new post_request("v1/customer/create", body: attributes)
    end

    def update(attributes={})
      Response.new post_request("v1/customer/update", body: attributes)
    end

    def delete(customer_id)
      Response.new post_request("v1/customer/delete", body: { customer_id: customer_id })
    end

    def export(attributes={})
      Response.new post_request("v1/customer/export", body: attributes)
    end

    def sale
      SaleByCustomerResource.new(client)
    end
  end
end
