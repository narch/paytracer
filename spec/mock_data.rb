require 'dotenv'
Dotenv.load('.env.test')

VALID_CUSTOMER = {
  integrator_id: ENV["PT_TEST_INTEGRATOR_ID"],
  customer_id: "99",
  credit_card: {
    number: "4012000098765439",
    expiration_month: "12",
    expiration_year: "#{Time.now.year + 2}"
  },
  billing_address: {
    name: "Nathan Williams",
    street_address: "1234 Main St.",
    city: "Los Angeles",
    state: "CA",
    zip: "90210"
  }
}

VALID_KEYED_SALE = {
  integrator_id: ENV["PT_TEST_INTEGRATOR_ID"],
  amount: 51.88,
  credit_card: {
    number: "4012000098765439",
    expiration_month: "12",
    expiration_year: "#{Time.now.year + 2}"
  },
  billing_address: {
    name: "Nathan Williams",
    street_address: "1234 Main St.",
    city: "Los Angeles",
    state: "CA",
    zip: "90210"
  }
}

VALID_SALE_BY_CUSTOMER = {
  integrator_id: ENV["PT_TEST_INTEGRATOR_ID"],
  customer_id: "99",
  amount: 25.00
}

VALID_SALE_BY_TRANSACTION = {
  integrator_id: ENV["PT_TEST_INTEGRATOR_ID"],
  transaction_id: "125391265",
  amount: 19.95
}
