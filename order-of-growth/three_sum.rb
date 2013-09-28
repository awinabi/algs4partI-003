class ThreeSum

  def initialize(ary)
    @ary = ary
  end

  def brute_find
    n = @ary.length
    for i in 0..n-1
      for j in i+1..n-1
        for k in j+1..n-1
          if @ary[i]+@ary[j]+@ary[k] == 0
            puts "FOUND - #{i}(#{@ary[i]}),#{j}(#{@ary[j]}),#{k}(#{@ary[k]})"
          end
        end
      end
    end
  end

  def improved_find
    n_ary = @ary.sort
    puts "Sorted: #{n_ary}"
    n = n_ary.length
    for i in 0..n-1
      for j in i+1..n-1
        item = (n_ary[i] + n_ary[j])*-1
        search_index = binary_search(n_ary, item)
        if search_index > -1 and search_index!=i and search_index!=j
          puts "FOUND - #{i}(#{n_ary[i]}),#{j}(#{n_ary[j]}),#{search_index}(#{n_ary[search_index]})"
        end
      end
    end
  end

  private

  def binary_search(ary, item)

    low = 0
    high = ary.length - 1

    while low<=high
      mid = ( low + high ) / 2
      # puts "low: #{low}, high: #{high}, mid: #{mid}"
      if ary[mid] < item
        low = mid + 1
      elsif ary[mid] > item
        high = mid - 1
      else
        return mid
      end
    end
    return -1

  end


end


a = [12,-18, 0, -12, 18, 20, 40, 30]
ts = ThreeSum.new(a)
ts.brute_find
puts "~~~~~~~~~~~~~~~~~~"
ts.improved_find