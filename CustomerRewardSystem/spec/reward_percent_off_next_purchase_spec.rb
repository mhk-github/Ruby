#! /usr/bin/env ruby
###############################################################################
# FILE     : reward_percent_off_next_purchase_spec.rb
# SYNOPSIS : RSpec tests for the RewardPercentOffNextPurchase class.
# LICENSE  : MIT
###############################################################################

###############################################################################
# IMPORTS
###############################################################################

require "reward_percent_off_next_purchase"

###############################################################################
# TESTS
###############################################################################

describe RewardPercentOffNextPurchase do
  before do
    @reward = RewardPercentOffNextPurchase.new(5)
  end

  describe ".what" do
    it "returns 'X percent off next purchase.' with X set at creation" do
      expect(@reward.what).to include("5 percent off next purchase.")
    end
  end
end

###############################################################################
# END
###############################################################################
# Local variables:
# mode: ruby
# End:
