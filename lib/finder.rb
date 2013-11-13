require 'bundler/setup'
Bundler.require
require 'helper'

class Finder
  include Helper

  def initialize(array)
    @array = array
    @output = []
    @threads = []
  end

  def search
    diff_case(@array, 2)
    @output
  end

  def diff_case(array, count)
    if @output.length != 2 && array.length > 1
      is_on_middle?(array)
      case diff_on_middle(array)
        when 0
          diff_case(second_half(array), count)
        when 1
          if count == 2
            two_parts(array).each { |part| diff_case(part, 1) }
          else
            diff_case(first_half(array), 1)
          end
        when 2
          diff_case(first_half(array), count)
        else
          raise "Count of missed numbers is over than 2"
      end
    end
  end

  def is_on_middle?(array)
    parts = two_parts(array)
    diff = parts[1].first - parts[0].last
    diff > 1 ? fill_output(parts[0].last, diff) : false
  end

  def fill_output(last_item, diff)
    while diff > 1 do
      diff -= 1
      @output <<  (last_item + diff)
    end
  end
end