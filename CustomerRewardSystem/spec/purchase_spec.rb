#! /usr/bin/env ruby
###############################################################################
# FILE     : purchase_spec.rb
# SYNOPSIS : RSpec tests for the Purchase class.
# LICENSE  : MIT
###############################################################################

###############################################################################
# IMPORTS
###############################################################################

require "purchase"

###############################################################################
# TESTS
###############################################################################

describe Purchase do
  before do
    amount = 1000
    currency = "cents"
    purchase_time = Time.utc(2000, 1, 1)
    @purchase = Purchase.new(amount, currency, purchase_time)
  end

  describe ".amount" do
    it "returns the amount purchased as set at object creation time" do
      expect(@purchase.amount).to equal(1000)
    end
  end

  describe ".currency" do
    it "returns the currency as set at object creation time" do
      expect(@purchase.currency).to include("cents")
    end
  end

  describe ".when_purchased" do
    it "returns the purchase time as set at object creation time" do
      expect(
        @purchase.when_purchased.utc.to_i
      ).to equal(
        Time.utc(2000, 1, 1).to_i
      )
    end
  end

  describe ".to_s" do
    it "returns the string version of the object" do
      expect(
        @purchase.to_s
      ).to include(
        "<Purchase: amount=1000, currency='cents', " \
        "when_purchased='2000-01-01 00:00:00 UTC'>"
      )
    end
  end
end

###############################################################################
# END
###############################################################################
# Local variables:
# mode: ruby
# End:
