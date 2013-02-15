require 'spec_helper'

describe Disc do
  it "starts with a size" do
    d = Disc.new(1)
    expect(d.size).to eq 1
  end
  
end