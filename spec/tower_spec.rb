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
end