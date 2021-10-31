#! /usr/bin/env ruby
###############################################################################
# FILE        : rule_time_limit.rb
# DESCRIPTION : A rule giving a reward if the purchase is within a time limit.
# LICENSE     : MIT
###############################################################################

###############################################################################
# IMPORTS
###############################################################################

require_relative "interface_rule"

###############################################################################
# CLASSES
###############################################################################

class RuleTimeLimit < InterfaceRule
  # A rule class valid when a purchase is made within a time limit of others.

  def initialize(time_tolerance_seconds, reward)
    @time_tolerance_seconds = time_tolerance_seconds
    @reward = reward
    @activities_hash = {}
  end

  def valid?(context)
    customer = context.customer
    customer_id = customer.customer_id
    purchase = context.activity
    latest_purchase_time = purchase.when_purchased
    previous_purchase_time = @activities_hash[customer_id]
    @activities_hash[customer_id] = latest_purchase_time
    unless previous_purchase_time.nil?
      time_difference_in_seconds = latest_purchase_time.to_i -
        previous_purchase_time.to_i
      if time_difference_in_seconds <= @time_tolerance_seconds
        return true
      end
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
