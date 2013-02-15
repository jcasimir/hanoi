require 'spec_helper'

describe Mover do
  it "exists" do
    expect{Mover.new}.to_not raise_error
  end

  context ".move_from_a_to_b" do
    let(:a){ Tower.new("A") }
    let(:b){ Tower.new("B") }
    let(:one){ Disc.new(1) }
    let(:two){ Disc.new(2) }

    it "moves a disc from A to B" do
      a.discs = [one]
      b.discs = [two]

      expect(Mover.move_from_a_to_b(a, b)).to be
      expect(b.top).to be one
      expect(a).to be_empty
    end

    it "cannot move when the target disc is smaller than the source" do
      a.discs = [two]
      b.discs = [one]

      expect(Mover.move_from_a_to_b(a, b)).to_not be
      expect(a.top).to be two
      expect(b.top).to be one
    end

    it "can move to an empty tower" do
      a.discs = [one]
      
      expect(Mover.move_from_a_to_b(a, b)).to be
      expect(b.top).to be one
      expect(a).to be_empty
    end
  end
  
end