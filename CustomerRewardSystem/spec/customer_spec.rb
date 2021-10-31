#! /usr/bin/env ruby
###############################################################################
# FILE     : customer_spec.rb
# SYNOPSIS : RSpec tests for the Customer class.
# LICENSE  : MIT
###############################################################################

###############################################################################
# IMPORTS
###############################################################################

require "customer"

###############################################################################
# TESTS
###############################################################################

describe Customer do
  before do
    @customer = Customer.new(10)
  end

  describe ".customer_id" do
    it "returns the identifier it was created with" do
      expect(@customer.customer_id).to equal(10)
    end
  end

  describe ".customer_id=" do
    it "raises NoMethodError if trying to change the identifier" do
      expect { @customer.customer_id = 1000 }.to raise_error(NoMethodError)
    end
  end
end

###############################################################################
# END
###############################################################################
# Local variables:
# mode: ruby
# End:
