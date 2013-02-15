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

  it "starts with no discs" do
    expect(tower.discs).to eq []
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

  context "#stack" do
    it "adds a disc to the top" do
      tower.discs = [Disc.new(2)]
      tower.stack(Disc.new(1))
      expect(tower.top.size).to eq 1
    end

    it "checks for stack validity" do
      tower.discs = [Disc.new(3), Disc.new(1)]
      expect{tower.stack(Disc.new(2))}.to raise_exception(InvalidStackError)
    end
  end

  context "#take" do
    it "removes the top disc" do
      tower.discs = [Disc.new(1), Disc.new(2)]
      expect(tower.take.size).to eq 1
    end
  end

  context "#validate!" do
    it "is cool with a valid stack" do
      tower.discs = [Disc.new(1), Disc.new(2)]
      expect{tower.validate!}.to_not raise_exception(InvalidStackError)
    end

    it "is raises on an invalid stack" do
      tower.discs = [Disc.new(2), Disc.new(1)]
      expect{tower.validate!}.to raise_exception(InvalidStackError)
    end

  end

  context "#valid?" do
    it "is cool with a valid stack" do
      tower.discs = [Disc.new(1), Disc.new(2)]
      expect(tower.valid?).to be
    end

    it "is angry about an invalid stack" do
      tower.discs = [Disc.new(2), Disc.new(1)]
      expect(tower.valid?).to_not be
    end
  end

  context "#size" do
    it "returns the number of discs when it has any" do
      tower.discs = [Disc.new(1)]
      expect(tower.size).to eq 1
    end

    it "returns the 0 when empty" do
      expect(tower.size).to eq 0
    end
  end
end