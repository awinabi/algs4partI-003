class BinarySearch

  def initialize(ary)
    @ary = ary
  end

  def search(item)
    low = 0
    high = @ary.length - 1
    while low!=high
      mid = ( low + high ) / 2
      puts "low: #{low}, high: #{high}, mid: #{mid}"

      if @ary[mid] < item
        low = mid + 1
      elsif @ary[mid] > item
        high = mid - 1
      else
        return mid
      end
    end

    if @ary[low] == item
      return low
    else
      return -1
    end

  end

end


a = [9, 0, 8, 3, 18, 5, 6]
sorted_a = a.sort
b = BinarySearch.new(sorted_a)
puts "b.search(5) => #{b.search(4)}"