#! /usr/bin/env ruby
###############################################################################
# FILE     : rule_null_spec.rb
# SYNOPSIS : RSpec tests for the RuleNull class.
# LICENSE  : MIT
###############################################################################

###############################################################################
# IMPORTS
###############################################################################

require "rule_null"

###############################################################################
# TESTS
###############################################################################

describe RuleNull do
  before do
    reward = RewardNone.new
    @rule = RuleNull.new(reward)
    customer_1 = Customer.new(1)
    purchase_1 = Purchase.new(2000, "cents", Time.utc(2021, 1, 1, 11, 15, 45))
    @customer_context_1 = CustomerContext.new(customer_1, purchase_1)
    customer_2 = Customer.new(2)
    purchase_2 = Purchase.new(1000, "cents", Time.utc(2021, 1, 1, 11, 15, 45))
    @customer_context_2 = CustomerContext.new(customer_2, purchase_2)
  end

  describe ".valid?" do
    it "always returns true" do
      expect(@rule.valid?(@customer_context_1)).to equal(true)
      expect(@rule.valid?(@customer_context_2)).to equal(true)
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
