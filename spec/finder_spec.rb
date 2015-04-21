require 'spec_helper'

describe Finder do
  before do
    k = 100
    @input_array = (1..k).to_a
    @missed_items = []
    2.times do
      sample = @input_array.sample
      @missed_items.concat([sample])
      @input_array.delete sample
    end
    @finder = Finder.new(@input_array)
  end

  it "should return missed items" do
    expect(@finder.search).to eq(@missed_items.sort)
  end

  it "should include 1 if skipped" do
    @finder = Finder.new([2, 3, 4, 6, 7])
    expect(@finder.search).to eq([1, 5])
  end

  it "should include close skipped items" do
    @finder = Finder.new([1, 2, 5, 6, 7])
    expect(@finder.search).to eq([3, 4])
  end
end
