#! /usr/bin/env ruby
###############################################################################
# FILE     : rule_time_limit_spec.rb
# SYNOPSIS : RSpec tests for the RuleTimeLimit class.
# LICENSE  : MIT
###############################################################################

###############################################################################
# IMPORTS
###############################################################################

require "rule_time_limit"

###############################################################################
# TESTS
###############################################################################

describe RuleTimeLimit do
  before do
    reward = RewardPercentOffNextPurchase.new(20)
    days = 30
    hours_per_day = 24
    minutes_per_hour = 60
    seconds_per_minute = 60
    tolerance_seconds = days * hours_per_day * minutes_per_hour *
      seconds_per_minute
    @rule = RuleTimeLimit.new(tolerance_seconds, reward)
    customer_1 = Customer.new(1)
    purchase_1_a = Purchase.new(
      2000,
      "cents",
      Time.utc(2021, 1, 1, 11, 15, 45)
    )
    @customer_context_1_a = CustomerContext.new(customer_1, purchase_1_a)
    purchase_1_b = Purchase.new(
      2000,
      "cents",
      Time.utc(2021, 1, 2, 11, 15, 45)
    )
    @customer_context_1_b = CustomerContext.new(customer_1, purchase_1_b)
    customer_2 = Customer.new(2)
    purchase_2_a = Purchase.new(
      1000,
      "cents",
      Time.utc(2021, 3, 1, 11, 15, 45)
    )
    @customer_context_2_a = CustomerContext.new(customer_2, purchase_2_a)
    purchase_2_b = Purchase.new(
      1000,
      "cents",
      Time.utc(2021, 4, 1, 11, 15, 45)
    )
    @customer_context_2_b = CustomerContext.new(customer_2, purchase_2_b)
  end

  describe ".valid?" do
    it "returns true if another purchase is with a time limit of an earlier " \
      "one" do
      expect(@rule.valid?(@customer_context_1_a)).to equal(false)
      expect(@rule.valid?(@customer_context_1_b)).to equal(true)
      expect(@rule.valid?(@customer_context_2_a)).to equal(false)
      expect(@rule.valid?(@customer_context_2_b)).to equal(false)
    end
  end

  describe ".evaluate" do
    it "adds the reward to the customer context" do
      expect(@customer_context_1_b.results.size).to equal(0)
      @rule.evaluate(@customer_context_1_b)
      expect(@customer_context_1_b.results.size).to equal(1)
    end
  end
end

###############################################################################
# END
###############################################################################
# Local variables:
# mode: ruby
# End:
