#! /usr/bin/env ruby
###############################################################################
# FILE        : reward_none.rb
# DESCRIPTION : A class to represent no reward for the customer purchase.
# LICENSE     : MIT
###############################################################################

###############################################################################
# IMPORTS
###############################################################################

require_relative "interface_reward"

###############################################################################
# CLASSES
###############################################################################

class RewardNone < InterfaceReward
  # A class to represent no reward at all.

  @@reward = "No reward at this time."

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
