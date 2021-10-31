#! /usr/bin/env ruby
###############################################################################
# FILE        : interface_rule_engine.rb
# DESCRIPTION : All concrete rule engine classes implement this interface.
# LICENSE     : MIT
###############################################################################

###############################################################################
# CLASSES
###############################################################################

class InterfaceRuleEngine
  # An interface class for all rule engines.

  def initialize
    raise NotImplementedError.new(
      "InterfaceRuleEngine is an interface not a concrete class !"
    )
  end

  def run_all_rules(context)
    raise NotImplementedError.new(
      "InterfaceRuleEngine#evaluate_all_rules must be implemented !"
    )
  end
end

###############################################################################
# END
###############################################################################
# Local variables:
# mode: ruby
# End:
