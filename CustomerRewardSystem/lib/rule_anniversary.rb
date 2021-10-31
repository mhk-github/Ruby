#! /usr/bin/env ruby
###############################################################################
# FILE        : rule_anniversary.rb
# DESCRIPTION : A rule to give a reward for a purchase on an anniversary.
# LICENSE     : MIT
###############################################################################

###############################################################################
# IMPORT
###############################################################################

require_relative "interface_rule"

###############################################################################
# CLASSES
###############################################################################

class RuleAnniversary < InterfaceRule
  # A class for processing any purchase made on a set anniversary day.

  def initialize(check_time, reward)
    @check_time = check_time
    @reward = reward
  end

  def valid?(context)
    purchase = context.activity
    purchase_time = purchase.when_purchased
    if purchase_time.day == @check_time.day && purchase_time.month == @check_time.month
      return true
    end
    false
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
