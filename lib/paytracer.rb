# frozen_string_literal: true

require_relative "paytracer/version"

module Paytracer
  autoload :Error, "paytracer/error"
  autoload :Configuration, "paytracer/configuration"
  autoload :Client, "paytracer/client"
  autoload :Resource, "paytracer/resource"
  autoload :AccessToken, "paytracer/resources/access_token"
  autoload :CustomerResource, "paytracer/resources/customer"
  autoload :SaleResource, "paytracer/resources/sale"
  autoload :KeyedSaleResource, "paytracer/resources/keyed_sale"
  autoload :SaleByCustomerResource, "paytracer/resources/sale_by_customer"
  autoload :SaleByTransactionResource, "paytracer/resources/sale_by_transaction"
  autoload :Object, "paytracer/object"
  autoload :Response, "paytracer/objects/response"

  class << self
    attr_reader :configuration
  end

  def self.configuration
    @configuration ||= Configuration.new
  end

  def self.configure
    yield(configuration)
  end
end
