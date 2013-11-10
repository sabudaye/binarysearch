require 'bundler/setup'
Bundler.require

class Helper
  def self.middle_index(array)
    array.length / 2
  end

  def self.first_half(array)
    array.slice(0, middle_index(array))
  end

  def self.second_half(array)
    array.slice(middle_index(array), array.length)
  end

  def self.two_parts(array)
    @out = []
    @out << first_half(array)
    @out << second_half(array)
  end

  def self.diff_on_middle(array)
    middle = middle_index(array)
    array[middle] - ( middle + array.first ) unless array[middle].nil?
  end
end