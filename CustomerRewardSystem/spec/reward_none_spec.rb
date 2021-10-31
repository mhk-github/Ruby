#! /usr/bin/env ruby
###############################################################################
# FILE     : reward_none_spec.rb
# SYNOPSIS : RSpec tests for the RewardNone class.
# LICENSE  : MIT
###############################################################################

###############################################################################
# IMPORTS
###############################################################################

require "reward_none"

###############################################################################
# TESTS
###############################################################################

describe RewardNone do
  before do
    @reward = RewardNone.new
  end

  describe ".what" do
    it "returns the string 'No reward at this time.'" do
      expect(@reward.what).to include("No reward at this time.")
    end
  end
end

###############################################################################
# END
###############################################################################
# Local variables:
# mode: ruby
# End:
