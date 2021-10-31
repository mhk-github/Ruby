#! /usr/bin/env ruby
###############################################################################
# FILE     : interface_rule_engine_spec.rb
# SYNOPSIS : RSpec tests for the InterfaceRuleEngine interface.
# LICENSE  : MIT
###############################################################################

###############################################################################
# IMPORTS
###############################################################################

require "interface_rule_engine"

###############################################################################
# TESTS
###############################################################################

describe InterfaceRuleEngine do
  describe ".new" do
    it "raises NotImplementedError if trying to create an object" do
      expect { InterfaceRuleEngine.new }.to raise_error(NotImplementedError)
    end
  end
end

###############################################################################
# END
###############################################################################
# Local variables:
# mode: ruby
# End:
