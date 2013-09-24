class QuickFind

  def initialize(n)
    @qf_ary = *(0..n.to_i)
  end
    
  def union(a,b)
    if @qf_ary[a] != @qf_ary[b]
      a_val = @qf_ary[a]
      b_val = @qf_ary[b]
      @qf_ary.each_index do |i|
        if @qf_ary[i] == a_val
          @qf_ary[i] = b_val
        end
      end
    end
  end

  def is_connected?(a,b)
    @qf_ary[a] == @qf_ary[b]
  end

  def print_state
    puts @qf_ary.to_s
  end

end

qf = QuickFind.new(10)
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

eqf = QuickFind.new(9)
#5-9 7-0 5-0 9-3 4-3 1-0 
puts "exercise 5-9 7-0 5-0 9-3 4-3 1-0"
eqf.union(5,9)
eqf.union(7,0)
eqf.union(5,0)
eqf.union(9,3)
eqf.union(4,3)
eqf.union(1,0)
qf.print_state()
