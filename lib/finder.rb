require 'bundler/setup'
Bundler.require

# TODO Helper as module
class Finder
  def initialize(array)
    @array = array
    @output = []
  end

  def search
    diff_case(@array, 2)
    @output
  end

  def diff_case(array, count)
    if @output.length != 2 && array.length > 1
      is_on_middle?(array)
      diff = Helper.diff_on_middle(array)
      case diff
        when 0
          diff_case(Helper.second_half(array), count)
        when 1
          if count == 2
            parts = Helper.two_parts(array)
            parts.each { |arr| diff_case(arr, 1) }
          else
            diff_case(Helper.first_half(array), 1)
          end
        when 2
          diff_case(Helper.first_half(array), count)
        else
          raise "Error. Array #{array.inspect} ;
                  Middle Item: #{array[Helper.middle_index(array)]} ;
                  Middle Index: #{Helper.middle_index(array)} ;
                  Diff: #{Helper.diff_on_middle(array)}"
      end
    end
  end

  def is_on_middle?(array)
    parts = Helper.two_parts(array)
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