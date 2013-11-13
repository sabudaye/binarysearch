require 'spec_helper'

describe Finder do
  before do
    @input_array = (1..100).to_a
    @delete_list = 2.times.map { rand(2..99) } # fixme, first last
    @delete_list.each { |del| @input_array.delete_at(@input_array.index(del)) }
    @finder = Finder.new(@input_array)
  end

  it "should find items" do
    expect(@finder.search.sort).to eq(@delete_list.sort)
  end
end