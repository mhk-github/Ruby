#! /usr/bin/env ruby
###############################################################################
# FILE        : rule_buy_limit.rb
# DESCRIPTION : A rule giving a reward when a purchase is at least some amount.
# LICENSE     : MIT
###############################################################################

###############################################################################
# IMPORT
###############################################################################

require_relative "interface_rule"

###############################################################################
# CLASSES
###############################################################################

class RuleBuyLimit < InterfaceRule
  # A class for processing any purchase at least as big as some threshold.

  def initialize(valid_amount, valid_currency, reward)
    @valid_amount = valid_amount
    @valid_currency = valid_currency
    @reward = reward
  end

  def valid?(context)
    purchase = context.activity
    if purchase.amount >= @valid_amount && purchase.currency == @valid_currency
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
