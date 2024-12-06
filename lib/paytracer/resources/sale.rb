# frozen_string_literal: true

module Paytracer
  class SaleResource < Resource
    def keyed
      KeyedSaleResource.new(client)
    end

    def by_customer
      SaleByCustomerResource.new(client)
    end

    def by_transaction
      SaleByTransactionResource.new(client)
    end
  end
end
