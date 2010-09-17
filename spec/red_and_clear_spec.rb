require 'spec_helper'
require "#{File.dirname __FILE__}/../app/bullshit_profit_calculator.rb"

describe BullshitProfitCalculator, "#calculate" do
  it "should return the projected profit" do
    subject.calculate('dummy author').should == '$123'.to_money
  end
end

module TestMoneyFormatter
  def inspect
    format
  end
end
class Money
  include TestMoneyFormatter
end
