class QuickUnion

  def initialize(n)
    @qu_ary = *(0..n.to_i)
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

  def print_state
    puts @qu_ary.to_s
  end

  def parent_node(a)
    @qu_ary[a]
  end

  def is_root?(a)
    @qu_ary[a] == a
  end

end


qf = QuickUnion.new(10)
qf.print_state()
qf.union(0,1)
qf.print_state()
qf.union(0,5)
qf.print_state()
qf.union(2,4)
qf.print_state()
puts "connected(1,5) => #{qf.is_connected?(1,5)}"
qf.union(1,2)
qf.print_state()
puts "connected(2,5) => #{qf.is_connected?(2,5)}"