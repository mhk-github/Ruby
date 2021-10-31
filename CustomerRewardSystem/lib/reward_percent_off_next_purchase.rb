#! /usr/bin/env ruby
###############################################################################
# FILE        : reward_percent_off_next_purchase.rb
# DESCRIPTION : A class to represent some percentage off next purchase reward.
# LICENSE     : MIT
###############################################################################

###############################################################################
# IMPORTS
###############################################################################

require_relative "interface_reward"

###############################################################################
# CLASSES
###############################################################################

class RewardPercentOffNextPurchase < InterfaceReward
  # A class for the reward of a percentage discount from the next purchase.

  def initialize(percent_off)
    @percent_off = percent_off
  end

  def what
    "#{@percent_off} percent off next purchase."
  end
end

###############################################################################
# END
###############################################################################
# Local variables:
# mode: ruby
# End:
