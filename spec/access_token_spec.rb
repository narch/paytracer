# frozen_string_literal: true

require 'dotenv'
Dotenv.load('.env.test')

RSpec.describe Paytracer::AccessToken do
  describe ".create" do
    it "creates a new access token" do
      VCR.use_cassette("create access token") do
        token = Paytracer::AccessToken.create(username: ENV["PT_TEST_USERNAME"], password: ENV["PT_TEST_PASSWORD"])
        expect(token.access_token).to eq("<ACCESS_TOKEN>")
      end
    end
  end

  describe ".set_credentials" do
    context "when credentials are passed to method" do
      it "returns an array with username and password" do 
        username, password = Paytracer::AccessToken.set_credentials(username: "tester1", password: "abc123")
        expect(username).to eq("tester1")
        expect(password).to eq("abc123")
      end
    end

    context "when credentials are returned from configuration" do
      it "returns an array with username and password" do
        Paytracer.configure do |config|
          config.username = "tester2"
          config.password = "def456"
        end
        username, password = Paytracer::AccessToken.set_credentials
        expect(username).to eq("tester2")
        expect(password).to eq("def456")
      end
    end
  end
end
