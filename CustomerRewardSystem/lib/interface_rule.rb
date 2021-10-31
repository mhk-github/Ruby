#! /usr/bin/env ruby
###############################################################################
# FILE        : interface_rule.rb
# DESCRIPTION : All concrete rule classes implement this interface.
# LICENSE     : MIT
###############################################################################

###############################################################################
# CLASSES
###############################################################################

class InterfaceRule
  # An interface class for all rules.

  def initialize
    raise NotImplementedError.new(
      "InterfaceRule is an interface not a concrete class !"
    )
  end

  def valid?(context)
    raise NotImplementedError.new(
      "InterfaceRule#valid? must be implemented !"
    )
  end

  def evaluate(context)
    raise NotImplementedError.new(
      "InterfaceRule#evaluate must be implemented !"
    )
  end
end

###############################################################################
# END
###############################################################################
# Local variables:
# mode: ruby
# End:
