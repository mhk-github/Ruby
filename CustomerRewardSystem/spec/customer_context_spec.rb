#! /usr/bin/env ruby
###############################################################################
# FILE     : customer_context_spec.rb
# SYNOPSIS : RSpec tests for the CustomerContext class.
# LICENSE  : MIT
###############################################################################

###############################################################################
# IMPORTS
###############################################################################

require "customer_context"

###############################################################################
# TESTS
###############################################################################

describe CustomerContext do
  before do
    customer = Customer.new(10)
    purchase = Purchase.new(1000, "cents", Time.utc(2000, 1, 1))
    @customer_context = CustomerContext.new(customer, purchase)
  end

  describe ".add_result" do
    it "adds a result to its internal store of results" do
      expect(@customer_context.results.size).to equal(0)
      reward = RewardNone.new
      @customer_context.add_result(reward)
      expect(@customer_context.results.size).to equal(1)
    end
  end
end

###############################################################################
# END
###############################################################################
# Local variables:
# mode: ruby
# End:
