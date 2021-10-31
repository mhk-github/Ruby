#! /usr/bin/env ruby
###############################################################################
# FILE     : reward_star_wars_spec.rb
# SYNOPSIS : RSpec tests for the RewardStarWars class.
# LICENSE  : MIT
###############################################################################

###############################################################################
# IMPORTS
###############################################################################

require "reward_star_wars"

###############################################################################
# TESTS
###############################################################################

describe RewardStarWars do
  before do
    @reward = RewardStarWars.new
  end

  describe ".what" do
    it "returns the string 'Star Wars item to be added to delivery.'" do
      expect(@reward.what).to include(
        "Star Wars item to be added to delivery."
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
