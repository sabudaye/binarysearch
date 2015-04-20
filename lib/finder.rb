require 'bundler/setup'
Bundler.require

class Finder
  def initialize(arr)
    @arr = arr
  end

  def search
    search_recursive(@arr)
  end

  private
  def search_recursive(arr, acc = [])
    if no_missed?(arr)
      acc
    else
      missed_item = arr.bsearch { |x| arr.index(x) + arr.first != x } - 1
      search_recursive(arr.slice(arr.index(missed_item + 1), arr.length),
                       acc | [missed_item])
    end
  end

  def no_missed?(arr)
    arr.first + arr.rindex(arr.last) == arr.last
  end
end
