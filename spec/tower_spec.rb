require 'spec_helper'

describe Tower do 
  let(:tower){ Tower.new("a") }

  it "has a name" do
    expect(tower.name).to eq "a"
  end

  it "has discs" do
    discs = [Disc.new(1), Disc.new(2), Disc.new(3), Disc.new(4)]
    tower.discs = discs
    expect(tower.discs).to eq discs
  end

  context "#can_support?" do
    it "can support a smaller disc" do
      tower.discs = [Disc.new(2)]
      newbie = Disc.new(1)
      expect(tower.can_support?(newbie)).to be
    end

    it "cannot support a larger disc" do
      tower.discs = [Disc.new(2)]
      newbie = Disc.new(3)
      expect(tower.can_support?(newbie)).to_not be
    end
  end

  context "#top" do
    it "returns the top disc" do
      tower.discs = [Disc.new(1), Disc.new(2)]
      expect(tower.top.size).to eq 1
    end
  end
end