require 'spec_helper'

describe Mover do
  it "exists" do
    expect{Mover.new}.to_not raise_error
  end

  context ".move_from_a_to_b" do
    it "moves a disc from A to B" do
      a   = Tower.new("A")
      b   = Tower.new("B")
      one = Disc.new(1)
      two = Disc.new(2)      
      a.discs = [one]
      b.discs = [two]

      Mover.move_from_a_to_b(a, b)
    end
  end
  
end