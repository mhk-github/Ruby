#! /usr/bin/env ruby
###############################################################################
# FILE     : customer_rewards_analyzer_spec.rb
# SYNOPSIS : RSpec tests for the CustomerRewardsAnalyzer class.
# LICENSE  : MIT
###############################################################################

###############################################################################
# IMPORTS
###############################################################################

require "customer_rewards_analyzer"

###############################################################################
# TESTS
###############################################################################

describe CustomerRewardsAnalyzer do
  before do
    @test_data = [
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

    next_purchase_free_reward = RewardNextPurchaseFree.new
    no_reward = RewardNone.new
    twenty_percent_off_next_purchase_reward = RewardPercentOffNextPurchase.new(
      20
    )
    star_wars_reward = RewardStarWars.new

    buy_limit_1500_cents_rule = RuleBuyLimit.new(
      1500,
      "cents",
      next_purchase_free_reward
    )
    null_rule = RuleNull.new(no_reward)
    star_wars_rule = RuleAnniversary.new(
      Time.utc(2021, 5, 4),
      star_wars_reward
    )
    time_limit_30_days_in_seconds_rule = RuleTimeLimit.new(
      (30 * 24 * 60 * 60),
      twenty_percent_off_next_purchase_reward
    )

    rules_engine = RuleEngineDynamicChooseLatest.new(null_rule)
    rules_engine.add_rule(buy_limit_1500_cents_rule)
    rules_engine.add_rule(time_limit_30_days_in_seconds_rule)
    rules_engine.add_rule(star_wars_rule)

    @customer_rewards_analyzer = CustomerRewardsAnalyzer.new(
      rules_engine,
      @test_data
    )
  end

  describe ".process_purchases" do
    it "sets rewards based on what customers purchase and rules" do
      expect(@customer_rewards_analyzer.results_array.size).to equal(0)

      @customer_rewards_analyzer.process_purchases
      expect(@customer_rewards_analyzer.results_array.size).to equal(
        @test_data.size
      )

      results_a = @customer_rewards_analyzer.results_array
      expect(results_a[0].results[0].what).to include(
        "Next purchase is free."
      )
      expect(results_a[1].results[0].what).to include(
        "Star Wars item to be added to delivery."
      )
      expect(results_a[2].results[0].what).to include(
        "No reward at this time."
      )
      expect(results_a[3].results[0].what).to include(
        "No reward at this time."
      )
      expect(results_a[4].results[0].what).to include(
        "Next purchase is free."
      )
      expect(results_a[5].results[0].what).to include(
        "No reward at this time."
      )
      expect(results_a[6].results[0].what).to include(
        "20 percent off next purchase."
      )
      expect(results_a[7].results[0].what).to include(
        "No reward at this time."
      )
      expect(results_a[8].results[0].what).to include(
        "Star Wars item to be added to delivery."
      )

      @customer_rewards_analyzer.process_purchases
      expect(@customer_rewards_analyzer.results_array.size).to equal(
        @test_data.size
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
