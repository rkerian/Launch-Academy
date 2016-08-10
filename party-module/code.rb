module PartyGoer
  require_relative 'personalized_havoc_error.rb'

  attr_accessor :no_drinks
  attr_reader :no_drinks, :is_included

  def initialize
    @no_drinks = 0
  end

  def drink
    @no_drinks += 1
    @no_drinks < 4 ? true : false
  end

  def sing
    "a string"
  end

  def cause_havoc
    raise PersonalizedHavocError, "You should define this yourself!"
  end

  def self.included(klass)
    true
  end
end
