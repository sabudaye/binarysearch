require 'spec_helper'

describe Finder do
  before do
    @input_array = (1..20).to_a
    @delete_list = 2.times.map { rand(1..19) }
    @delete_list.each do |del|
      @input_array.delete_at(@input_array.index(del))
    end
    @finder = Finder.new(@input_array)
  end

  it "should find items" do
    expect(@finder.search).to eq(@delete_list.sort)
  end
end