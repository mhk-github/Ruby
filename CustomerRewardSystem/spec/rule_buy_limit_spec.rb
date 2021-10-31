#! /usr/bin/env ruby
###############################################################################
# FILE     : rule_buy_limit_spec.rb
# SYNOPSIS : RSpec tests for the RuleBuyLimit class.
# LICENSE  : MIT
###############################################################################

###############################################################################
# IMPORTS
###############################################################################

require "rule_buy_limit"

###############################################################################
# TESTS
###############################################################################

describe RuleBuyLimit do
  before do
    reward = RewardNextPurchaseFree.new
    limit = 1500
    currency = "cents"
    @rule = RuleBuyLimit.new(limit, currency, reward)
    customer_1 = Customer.new(1)
    purchase_1 = Purchase.new(2000, "cents", Time.utc(2021, 1, 1, 11, 15, 45))
    @customer_context_1 = CustomerContext.new(customer_1, purchase_1)
    customer_2 = Customer.new(2)
    purchase_2 = Purchase.new(1000, "cents", Time.utc(2021, 1, 1, 11, 15, 45))
    @customer_context_2 = CustomerContext.new(customer_2, purchase_2)
    customer_3 = Customer.new(3)
    purchase_3 = Purchase.new(
      2000,
      "pennies",
      Time.utc(2021, 1, 1, 11, 15, 45)
    )
    @customer_context_3 = CustomerContext.new(customer_3, purchase_3)
  end

  describe ".valid?" do
    it "returns true only when purchase at least as big as a given limit in " \
       "a given currency" do
      expect(@rule.valid?(@customer_context_1)).to equal(true)
      expect(@rule.valid?(@customer_context_2)).to equal(false)
      expect(@rule.valid?(@customer_context_3)).to equal(false)
    end
  end

  describe ".evaluate" do
    it "adds the reward to the customer context" do
      expect(@customer_context_1.results.size).to equal(0)
      @rule.evaluate(@customer_context_1)
      expect(@customer_context_1.results.size).to equal(1)
    end
  end
end

###############################################################################
# END
###############################################################################
# Local variables:
# mode: ruby
# End:
