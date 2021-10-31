#! /usr/bin/env ruby
###############################################################################
# FILE        : rule_null.rb
# DESCRIPTION : The rule that applies when all preceding rules fail in engine.
# LICENSE     : MIT
###############################################################################

###############################################################################
# IMPORTS
###############################################################################

require_relative "interface_rule"

###############################################################################
# CLASSES
###############################################################################

class RuleNull < InterfaceRule
  # A class valid for when no other rules in the rule engine apply.

  def initialize(reward)
    @reward = reward
  end

  def valid?(context)
    true
  end

  def evaluate(context)
    context.add_result(@reward)
  end
end

###############################################################################
# END
###############################################################################
# Local variables:
# mode: ruby
# End:
