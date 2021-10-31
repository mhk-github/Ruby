#! /usr/bin/env ruby
###############################################################################
# FILE     : rule_engine_dynamic_choose_latest_spec.rb
# SYNOPSIS : RSpec tests for the RuleEngineDynamicChooseLatest class.
# LICENSE  : MIT
###############################################################################

###############################################################################
# IMPORTS
###############################################################################

require "rule_engine_dynamic_choose_latest"

###############################################################################
# TESTS
###############################################################################

describe RuleEngineDynamicChooseLatest do
  before do
    no_reward = RewardNone.new
    star_wars_reward = RewardStarWars.new
    free_purchase_reward = RewardNextPurchaseFree.new

    @null_rule = RuleNull.new(no_reward)
    @anniversary_rule = RuleAnniversary.new(
      Time.utc(2000, 5, 4),
      star_wars_reward
    )
    @buy_limit_rule = RuleBuyLimit.new(1500, "cents", free_purchase_reward)
  end

  describe ".initialize" do
    it "guarantees a new rule engine has one rule" do
      customer = Customer.new(10)
      purchase = Purchase.new(1000, "cents", Time.utc(2000, 3, 3, 11, 45, 15))
      customer_context = CustomerContext.new(customer, purchase)
      expect(customer_context.results.size).to equal(0)

      engine = RuleEngineDynamicChooseLatest.new(@null_rule)
      engine.run_all_rules(customer_context)
      expect(customer_context.results.size).to equal(1)
    end
  end

  describe ".add_rule" do
    it "ensures new rules can be added to the rules engine with the latest " \
       "rule having precedence" do
      customer = Customer.new(1)
      purchase = Purchase.new(2000, "cents", Time.utc(2000, 3, 3, 11, 45, 15))
      customer_context_1 = CustomerContext.new(customer, purchase)

      engine = RuleEngineDynamicChooseLatest.new(@null_rule)
      engine.run_all_rules(customer_context_1)
      expect(customer_context_1.results[0].what).to include(
        "No reward at this time."
      )

      customer_context_2 = CustomerContext.new(customer, purchase)

      engine.add_rule(@buy_limit_rule)
      engine.run_all_rules(customer_context_2)
      expect(customer_context_2.results[0].what).to include(
        "Next purchase is free."
      )
    end
  end

  describe ".remove_rule" do
    it "ensures rules can be removed from the rules engine" do
      customer = Customer.new(1)
      purchase = Purchase.new(2000, "cents", Time.utc(2000, 3, 3, 11, 45, 15))
      customer_context_1 = CustomerContext.new(customer, purchase)

      engine = RuleEngineDynamicChooseLatest.new(@null_rule)
      engine.add_rule(@buy_limit_rule)
      engine.run_all_rules(customer_context_1)
      expect(customer_context_1.results[0].what).to include(
        "Next purchase is free."
      )

      customer_context_2 = CustomerContext.new(customer, purchase)

      engine.remove_rule(@buy_limit_rule)
      engine.run_all_rules(customer_context_2)
      expect(customer_context_2.results[0].what).to include(
        "No reward at this time."
      )
    end
  end

  describe ".run_all_rules" do
    it "stops at the first matching rule or the engine's initial rule" do
      customer_1 = Customer.new(1)
      purchase_1 = Purchase.new(
        2000,
        "cents",
        Time.utc(2000, 5, 4, 11, 45, 15)
      )
      customer_context_1 = CustomerContext.new(customer_1, purchase_1)

      engine = RuleEngineDynamicChooseLatest.new(@null_rule)
      engine.add_rule(@buy_limit_rule)
      engine.run_all_rules(customer_context_1)
      expect(customer_context_1.results[0].what).to include(
        "Next purchase is free."
      )

      customer_context_2 = CustomerContext.new(customer_1, purchase_1)

      engine.add_rule(@anniversary_rule)
      engine.run_all_rules(customer_context_2)
      expect(customer_context_2.results[0].what).to include(
        "Star Wars item to be added to delivery."
      )

      customer_2 = Customer.new(2)
      purchase_2 = Purchase.new(
        1000,
        "cents",
        Time.utc(2000, 5, 5, 11, 45, 15)
      )
      customer_context_3 = CustomerContext.new(customer_2, purchase_2)

      engine.run_all_rules(customer_context_3)
      expect(customer_context_3.results[0].what).to include(
        "No reward at this time."
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
