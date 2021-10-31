#! /usr/bin/env ruby
###############################################################################
# FILE        : reward_next_purchase_free.rb
# DESCRIPTION : A class to represent next purchase is free reward.
# LICENSE     : MIT
###############################################################################

###############################################################################
# IMPORTS
###############################################################################

require_relative "interface_reward"

###############################################################################
# CLASSES
###############################################################################

class RewardNextPurchaseFree < InterfaceReward
  # A class for the reward of the next purchase being free.

  @@reward = "Next purchase is free."

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
