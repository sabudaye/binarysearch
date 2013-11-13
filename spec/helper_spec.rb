require 'spec_helper'

describe Helper do
  before do
    @o = Object.new
    @o.extend(Helper)
  end
  it "should get two parts of array" do
    expect(@o.two_parts((1..6).to_a).first.first).to eq(1)
    expect(@o.two_parts((1..6).to_a).last.last).to eq(6)
  end
end