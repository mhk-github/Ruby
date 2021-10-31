#! /usr/bin/env ruby
###############################################################################
# FILE     : interface_reward_spec.rb
# SYNOPSIS : RSpec tests for the InterfaceReward interface.
# LICENSE  : MIT
###############################################################################

###############################################################################
# IMPORTS
###############################################################################

require "interface_reward"

###############################################################################
# TESTS
###############################################################################

describe InterfaceReward do
  describe ".new" do
    it "raises NotImplementedError if trying to create an object" do
      expect { InterfaceReward.new }.to raise_error(NotImplementedError)
    end
  end
end

###############################################################################
# END
###############################################################################
# Local variables:
# mode: ruby
# End:
