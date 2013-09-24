class WeightedQuickUnion
  def initialize(n)
    @wq = *(0..(n-1).to_i)
    @wq_sz = Array.new(n){|x| 0 }
  end

  def union(a,b)
    x = root(a)
    y = root(b)
    #p "x=#{x};y=#{y}"
    if @wq_sz[x] > @wq_sz[y]
      @wq[y] = x
      @wq_sz[x] = @wq_sz[y] + @wq_sz[x]
    else
      @wq[x] = y
      @wq_sz[y] = @wq_sz[y] + @wq_sz[x]
    end
    
  end
  
  def is_connected?(a,b)
    root(a) == root(b)
  end
  
  def root(a)
    while !is_root?(a)
      #puts "a=>#{a}, #{is_root?(a)}"
      a = parent_node(a)      
    end
    return a
  end
  
  def is_root?(a)
    @wq[a] == a
  end
  
  def parent_node(a)
    @wq[a]
  end
  
  def state
    @wq.to_s
  end
  
end

wq = WeightedQuickUnion.new(10)
puts "state => #{wq.state}"
puts "union(4,3) - #{wq.union(4,3)} - #{wq.state}"

puts "union(3,8) - #{wq.union(3,8)} - #{wq.state}"
puts "union(6,5) - #{wq.union(6,5)} - #{wq.state}"
puts "union(9,4) - #{wq.union(9,4)} - #{wq.state}"
puts "union(2,1) - #{wq.union(2,1)} - #{wq.state}"
puts "connected(8,9) => #{wq.is_connected?(8,9)}"
puts "connected(5,4) => #{wq.is_connected?(5,4)}"
puts "union(5,0) - #{wq.union(5,0)} - #{wq.state}"
puts "union(7,2) - #{wq.union(7,2)} - #{wq.state}"
puts "union(6,1) - #{wq.union(6,1)} - #{wq.state}"
puts "union(7,3) - #{wq.union(7,3)} - #{wq.state}"
puts "connected(2,5) => #{wq.is_connected?(2,5)}"


ew = WeightedQuickUnion.new(10)
puts "exercise 6-2 5-7 4-0 0-8 9-6 7-6 3-1 8-1 1-2 "
puts "#{ew.union(6,2)} - #{ew.state}"
puts "#{ew.union(5,7)} - #{ew.state}"
puts "#{ew.union(4,0)} - #{ew.state}"
puts "#{ew.union(0,8)} - #{ew.state}"
puts "#{ew.union(9,6)} - #{ew.state}"
puts "#{ew.union(7,6)} - #{ew.state}"
puts "#{ew.union(3,1)} - #{ew.state}"
puts "#{ew.union(8,1)} - #{ew.state}"
puts "#{ew.union(1,2)} - #{ew.state}"
puts "current state is #{ew.state}"

