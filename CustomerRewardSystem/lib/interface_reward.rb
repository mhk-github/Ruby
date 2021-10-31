#! /usr/bin/env ruby
###############################################################################
# FILE        : interface_reward.rb
# DESCRIPTION : All concrete reward classes implement this interface.
# LICENSE     : MIT
###############################################################################

###############################################################################
# CLASSES
###############################################################################

class InterfaceReward
  # An interface class for all rewards.

  def initialize
    raise NotImplementedError.new(
      "InterfaceReward is an interface not a concrete class !"
    )
  end

  def what
    raise NotImplementedError.new(
      "InterfaceReward#what must be implemented !"
    )
  end
end

###############################################################################
# END
###############################################################################
# Local variables:
# mode: ruby
# End:
