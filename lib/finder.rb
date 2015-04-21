class Finder
  def initialize(arr)
    @arr = arr
  end

  def search
    search_recursive(@arr)
  end

  private
  def search_recursive(arr, acc = [])
    if no_skipped?(arr)
      acc.sort
    else
      start_from = acc.empty? ? 1 : arr.first
      $index = 0
      skipped_item = arr.bsearch { |x| arr.index(x) + start_from != x } - 1
      skipped_items = [skipped_item]
      if skipped_item != 1 && arr.index(skipped_item - 1).nil?
        skipped_items.concat([skipped_item - 1])
      end
      search_recursive(arr.slice(arr.index(skipped_item + 1), arr.length),
                       acc | skipped_items)
    end
  end

  def no_skipped?(arr)
    arr.first + arr.rindex(arr.last) == arr.last
  end
end
