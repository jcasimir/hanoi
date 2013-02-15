require 'spec_helper'

describe Tower do 
  let(:tower){ Tower.new("a") }
  let(:one){   Disc.new(1)    }
  let(:two){   Disc.new(2)    }
  let(:three){ Disc.new(3)    }
  let(:four){  Disc.new(4)    }

  it "has a name" do
    expect(tower.name).to eq "a"
  end

  it "has discs" do
    discs = [one, two, three, Disc.new(4)]
    tower.discs = discs
    expect(tower.discs).to eq discs
  end

  it "starts with no discs" do
    expect(tower.discs).to eq []
  end

  context "#can_support?" do
    it "can support a smaller disc" do
      tower.discs = [two]
      newbie = one
      expect(tower.can_support?(newbie)).to be
    end

    it "cannot support a larger disc" do
      tower.discs = [two]
      newbie = three
      expect(tower.can_support?(newbie)).to_not be
    end
  end

  context "#top" do
    it "returns the top disc" do
      tower.discs = [one, two]
      expect(tower.top.size).to eq 1
    end
  end

  context "#stack" do
    it "adds a disc to the top" do
      tower.discs = [two]
      tower.stack(one)
      expect(tower.top.size).to eq 1
    end

    it "checks for stack validity" do
      tower.discs = [three, one]
      expect{tower.stack(two)}.to raise_exception(InvalidStackError)
    end
  end

  context "#take" do
    it "removes the top disc" do
      tower.discs = [one, two]
      expect(tower.take.size).to eq 1
    end
  end

  context "#validate!" do
    it "is cool with a valid stack" do
      tower.discs = [one, two]
      expect{tower.validate!}.to_not raise_exception(InvalidStackError)
    end

    it "is raises on an invalid stack" do
      tower.discs = [two, one]
      expect{tower.validate!}.to raise_exception(InvalidStackError)
    end

  end

  context "#valid?" do
    it "is cool with a valid stack" do
      tower.discs = [one, two]
      expect(tower.valid?).to be
    end

    it "is angry about an invalid stack" do
      tower.discs = [two, one]
      expect(tower.valid?).to_not be
    end
  end

  context "#size" do
    it "returns the number of discs when it has any" do
      tower.discs = [one]
      expect(tower.size).to eq 1
    end

    it "returns the 0 when empty" do
      expect(tower.size).to eq 0
    end
  end
end
