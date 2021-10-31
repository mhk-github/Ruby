#! /usr/bin/env ruby
###############################################################################
# FILE     : purchase.rb
# SYNOPSIS : A class representing a purchase.
# LICENSE  : MIT
###############################################################################

###############################################################################
# CLASSES
###############################################################################

class Purchase
  # Represents the activity of a customer purchase.

  attr_reader :amount, :currency, :when_purchased

  def initialize(amount, currency, when_purchased)
    @amount = amount
    @currency = currency
    @when_purchased = when_purchased
  end

  def to_s
    "<Purchase: " \
    "amount=#{@amount}, " \
    "currency='#{@currency}', " \
    "when_purchased='#{@when_purchased}'" \
    ">"
  end
end

###############################################################################
# END
###############################################################################
# Local variables:
# mode: ruby
# End:
