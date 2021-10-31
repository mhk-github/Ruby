#! /usr/bin/env ruby
###############################################################################
# FILE        : rule_engine_dynamic_choose_latest.rb
# DESCRIPTION : A rule engine that uses the latest applicable rule.
# LICENSE     : MIT
###############################################################################

###############################################################################
# IMPORTS
###############################################################################

require_relative "interface_rule_engine"

###############################################################################
# CLASSES
###############################################################################

class RuleEngineDynamicChooseLatest < InterfaceRuleEngine
  # A class for a rule engine using the latest applicable rule.

  def initialize(null_rule)
    @rules_hash = {null_rule => :rule_is_active}
  end

  def add_rule(rule)
    @rules_hash[rule] = :rule_is_active
  end

  def remove_rule(rule)
    @rules_hash.delete(rule)
  end

  def run_all_rules(context)
    @rules_hash.reverse_each do |k, v|
      if k.valid?(context)
        k.evaluate(context)
        break
      end
    end
  end
end

###############################################################################
# END
###############################################################################
# Local variables:
# mode: ruby
# End:
