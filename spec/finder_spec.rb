require 'spec_helper'

describe Finder do
  before do
    k = 10000
    @missed_items_num = 2
    @input_array = (1..k).to_a
    @missed_items = []
    @missed_items_num.times do
      sample = @input_array.sample
      @missed_items.concat([sample])
      @input_array.delete sample
    end
    @finder = Finder.new(@input_array)
  end

  it "Should return missed items" do
    expect(@finder.search).to eq(@missed_items)
  end
end
