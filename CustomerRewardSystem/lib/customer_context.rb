#! /usr/bin/env ruby
###############################################################################
# FILE     : customer_context.rb
# SYNOPSIS : A rules engine will use this class to evaluate rules on.
# LICENSE  : MIT
###############################################################################

###############################################################################
# CLASSES
###############################################################################

class CustomerContext
  # A class composed of a customer and their activity used to interact with a
  # rule engine.

  attr_reader :customer, :activity, :results

  def initialize(customer, activity)
    @customer = customer
    @activity = activity
    @results = []
  end

  def add_result(result)
    @results.push(result)
  end
end

###############################################################################
# END
###############################################################################
# Local variables:
# mode: ruby
# End:
