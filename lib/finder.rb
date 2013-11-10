require 'bundler/setup'
Bundler.require

class Finder
  def initialize(array)
    @array = array
    @output = []
  end

  def search
    find(@array)
    @output
  end
  def find(array)
    puts array.inspect
    if array.length == 2
      if (array.last - array.first) == 2
        @output << (array.first + 1)
      else
        @output << (array.last + 1)
      end
    else
      if @output.length != 2
        diff_case(array)
      end
    end
  end

  def diff_case(array)
    case Helper.diff_on_middle(array)
      when 0
        find(Helper.second_half(array))
      when 1
        parts = Helper.two_parts(array)
        if (parts[0].last - parts[1].first) == 2
          @output << (parts[0].last + 1)
        end
        parts.each { |arr| find(arr) }
      when 2
        find(Helper.first_half(array))
      else
        raise "Error. Array #{array.inspect} ;
                Middle Item: #{array[Helper.middle_index(array)]} ;
                Middle Index: #{Helper.middle_index(array)} ;
                Diff: #{Helper.diff_on_middle(array)}"
    end
  end
end