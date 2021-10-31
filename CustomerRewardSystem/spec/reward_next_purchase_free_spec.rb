#! /usr/bin/env ruby
###############################################################################
# FILE     : reward_next_purchase_free_spec.rb
# SYNOPSIS : RSpec tests for the RewardNextPurchaseFree class.
# LICENSE  : MIT
###############################################################################

###############################################################################
# IMPORTS
###############################################################################

require "reward_next_purchase_free"

###############################################################################
# TESTS
###############################################################################

describe RewardNextPurchaseFree do
  before do
    @reward = RewardNextPurchaseFree.new
  end

  describe ".what" do
    it "returns the string 'Next purchase is free.'" do
      expect(@reward.what).to include("Next purchase is free.")
    end
  end
end

###############################################################################
# END
###############################################################################
# Local variables:
# mode: ruby
# End:
