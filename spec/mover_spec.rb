require 'spec_helper'

describe Mover do
  let(:a){ Tower.new("A") }
  let(:b){ Tower.new("B") }
  let(:c){ Tower.new("C") }
  let(:one){ Disc.new(1) }
  let(:two){ Disc.new(2) }
  let(:three){ Disc.new(3) }
  let(:four){ Disc.new(4) }

  context ".move_from_a_to_b" do

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

    it "cannot move to itself" do
      expect(Mover.move_from_a_to_b(a, a)).to_not be
    end
  end

  context ".can_move_from_a_to_b?" do
    it "is false when a is empty" do
      expect(Mover.can_move_from_a_to_b?(a, b)).to_not be
    end
  end

  context ".move_all_from_a_to_b_via_c" do
    it "can move multiple discs in a valid pattern" do
      a.discs = [one, two, three, four]

      Mover.move_from_a_to_b_via_c(a.size, a, c, b)
      expect(a).to be_empty
      expect(b).to be_empty
      expect(c.discs).to eq [one, two, three, four]
    end
  end
  
end