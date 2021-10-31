#! /usr/bin/env ruby
###############################################################################
# FILE     : rule_anniversary_spec.rb
# SYNOPSIS : RSpec tests for the RuleAnniversary class.
# LICENSE  : MIT
###############################################################################

###############################################################################
# IMPORTS
###############################################################################

require "rule_anniversary"

###############################################################################
# TESTS
###############################################################################

describe RuleAnniversary do
  before do
    reward = RewardStarWars.new
    anniversary = Time.utc(2000, 5, 4)
    @rule = RuleAnniversary.new(anniversary, reward)
    customer_1 = Customer.new(1)
    purchase_1 = Purchase.new(1000, "cents", Time.utc(2021, 5, 4, 11, 15, 45))
    @customer_context_1 = CustomerContext.new(customer_1, purchase_1)
    customer_2 = Customer.new(2)
    purchase_2 = Purchase.new(1000, "cents", Time.utc(2021, 5, 5, 11, 15, 45))
    @customer_context_2 = CustomerContext.new(customer_2, purchase_2)
  end

  describe ".valid?" do
    it "returns true only when anniversary day and month match purchase's" do
      expect(@rule.valid?(@customer_context_1)).to equal(true)
      expect(@rule.valid?(@customer_context_2)).to equal(false)
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
