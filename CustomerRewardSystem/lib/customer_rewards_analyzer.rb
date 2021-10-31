#! /usr/bin/env ruby
###############################################################################
# FILE     : customer_rewards_analyzer.rb
# SYNOPSIS : A class to show rewards to customers based on their purchases.
# LICENSE  : MIT
###############################################################################

###############################################################################
# IMPORTS
###############################################################################

require_relative "customer"
require_relative "customer_context"
require_relative "purchase"
require_relative "reward_next_purchase_free"
require_relative "reward_none"
require_relative "reward_percent_off_next_purchase"
require_relative "reward_star_wars"
require_relative "rule_anniversary"
require_relative "rule_buy_limit"
require_relative "rule_engine_dynamic_choose_latest"
require_relative "rule_null"
require_relative "rule_time_limit"

###############################################################################
# CLASSES
###############################################################################

class CustomerRewardsAnalyzer
  # A class taking a rule engine and a list of purchase data to create an
  # array of rewards based on analysis by the rule engine.

  attr_reader :results_array

  def initialize(rule_engine, purchase_data)
    @rule_engine = rule_engine
    @purchase_data = purchase_data
    @results_array = []
    @already_processed = false
  end

  def process_purchases
    unless @already_processed
      @purchase_data.each do |x|
        customer = Customer.new(x[:customer_id])
        purchase = Purchase.new(
          x[:purchase_amount_cents],
          "cents",
          x[:created_at]
        )
        customer_context = CustomerContext.new(customer, purchase)
        @rule_engine.run_all_rules(customer_context)
        @results_array.push(customer_context)
      end
      @already_processed = true
    end
  end
end

###############################################################################
# FUNCTIONS
###############################################################################

def main
  # A driver function for this script.

  test_data = [
    {
      customer_id: 65,
      purchase_amount_cents: 1800,
      created_at: Time.utc(2009, 1, 2, 6, 1)
    },
    {
      customer_id: 31337,
      purchase_amount_cents: 6522,
      created_at: Time.utc(2009, 5, 4, 6, 12)
    },
    {
      customer_id: 4465,
      purchase_amount_cents: 987,
      created_at: Time.utc(2010, 8, 17, 11, 9)
    },
    {
      customer_id: 234234,
      purchase_amount_cents: 200,
      created_at: Time.utc(2010, 11, 1, 16, 12)
    },
    {
      customer_id: 12445,
      purchase_amount_cents: 1664,
      created_at: Time.utc(2010, 11, 18, 13, 19)
    },
    {
      customer_id: 234234,
      purchase_amount_cents: 1200,
      created_at: Time.utc(2010, 12, 2, 16, 12)
    },
    {
      customer_id: 12445,
      purchase_amount_cents: 1800,
      created_at: Time.utc(2010, 12, 3, 11, 17)
    },
    {
      customer_id: 65,
      purchase_amount_cents: 900,
      created_at: Time.utc(2011, 4, 28, 13, 16)
    },
    {
      customer_id: 65,
      purchase_amount_cents: 1600,
      created_at: Time.utc(2011, 5, 4, 11, 1)
    }
  ]

  # Set up the rewards
  next_purchase_free_reward = RewardNextPurchaseFree.new
  no_reward = RewardNone.new
  twenty_percent_off_next_purchase_reward = RewardPercentOffNextPurchase.new(
    20
  )
  star_wars_reward = RewardStarWars.new

  # Set up the rules
  buy_limit_rule = RuleBuyLimit.new(
    1500,
    "cents",
    next_purchase_free_reward
  )
  anniversary_rule = RuleAnniversary.new(
    Time.utc(2021, 5, 4),
    star_wars_reward
  )
  null_rule = RuleNull.new(no_reward)
  time_limit_rule = RuleTimeLimit.new(
    2592000,
    twenty_percent_off_next_purchase_reward
  )

  # Create the rules engine
  rules_engine = RuleEngineDynamicChooseLatest.new(null_rule)

  # Add rules to the rules engine
  rules_engine.add_rule(buy_limit_rule)
  rules_engine.add_rule(time_limit_rule)
  rules_engine.add_rule(anniversary_rule)

  # Run the rules engine on each purchase
  rewards_analysis = CustomerRewardsAnalyzer.new(
    rules_engine,
    test_data
  )
  rewards_analysis.process_purchases

  # Show the results
  rewards_analysis.results_array.each do |c|
    puts "Customer ID = #{c.customer.customer_id}"
    puts "  Activity = #{c.activity}"
    puts "  Results:"
    c.results.each { |x| puts "    #{x.what}" }
  end
end

###############################################################################
# DRIVER
###############################################################################

if __FILE__ == $0
  main
end

###############################################################################
# END
###############################################################################
# Local variables:
# mode: ruby
# End:
