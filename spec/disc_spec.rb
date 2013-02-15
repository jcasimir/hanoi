require 'spec_helper'

describe Disc do
  it "starts with a size" do
    d = Disc.new(1)
    expect(d.size).to eq 1
  end

  describe "#to_s" do
    it "is just the size" do
      d = Disc.new(1)
      expect(d.to_s).to eq "1"
    end
  end
  
end