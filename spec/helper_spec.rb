require 'spec_helper'

describe Helper do
  it "should get two parts of array" do
    expect(Helper.two_parts((1..6).to_a).first.first).to eq(1)
    expect(Helper.two_parts((1..6).to_a).last.last).to eq(6)
  end
end