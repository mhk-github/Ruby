#! /usr/bin/env ruby
###############################################################################
# FILE     : interface_rule_spec.rb
# SYNOPSIS : RSpec tests for the InterfaceRule interface.
# LICENSE  : MIT
###############################################################################

###############################################################################
# IMPORTS
###############################################################################

require "interface_rule"

###############################################################################
# TESTS
###############################################################################

describe InterfaceRule do
  describe ".new" do
    it "raises NotImplementedError if trying to create an object" do
      expect { InterfaceRule.new }.to raise_error(NotImplementedError)
    end
  end
end

###############################################################################
# END
###############################################################################
# Local variables:
# mode: ruby
# End:
