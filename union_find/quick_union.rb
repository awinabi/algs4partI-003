class QuickUnion

  def initialize(n)
    @qu_ary = *(0..(n-1).to_i)
  end

  def union(a,b)
    @qu_ary[root(a)] = root(b)
  end

  def root(a)
    a_parent = parent_node(a)
    while !is_root?(a_parent)
      a_parent = parent_node(a_parent)
    end
    return a_parent
  end

  def is_connected?(a,b)
    root(a) == root(b)
  end

  def state
    @qu_ary.to_s
  end

  def parent_node(a)
    @qu_ary[a]
  end

  def is_root?(a)
    @qu_ary[a] == a
  end

end


qf = QuickUnion.new(10)
puts "state => #{qf.state}"
puts "union(4,3) - #{qf.union(4,3)} - #{qf.state}"

puts "union(3,8) - #{qf.union(3,8)} - #{qf.state}"
puts "union(6,5) - #{qf.union(6,5)} - #{qf.state}"
puts "union(9,4) - #{qf.union(9,4)} - #{qf.state}"
puts "union(2,1) - #{qf.union(2,1)} - #{qf.state}"
puts "connected(8,9) => #{qf.is_connected?(8,9)}"
puts "connected(5,4) => #{qf.is_connected?(5,4)}"
puts "union(5,0) - #{qf.union(5,0)} - #{qf.state}"
puts "union(7,2) - #{qf.union(7,2)} - #{qf.state}"
puts "union(6,1) - #{qf.union(6,1)} - #{qf.state}"
puts "union(7,3) - #{qf.union(7,3)} - #{qf.state}"
puts "connected(2,5) => #{qf.is_connected?(2,5)}"