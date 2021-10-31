#! /usr/bin/env ruby
###############################################################################
# FILE        : reward_star_wars.rb
# DESCRIPTION : A class to represent a reward for a purchase on May 4th.
# LICENSE     : MIT
###############################################################################

###############################################################################
# IMPORTS
###############################################################################

require_relative "interface_reward"

###############################################################################
# CLASSES
###############################################################################

class RewardStarWars < InterfaceReward
  # A class for the reward of a purchase on May 4th.

  @@reward = "Star Wars item to be added to delivery."

  def initialize
  end

  def what
    @@reward
  end
end

###############################################################################
# END
###############################################################################
# Local variables:
# mode: ruby
# End:
