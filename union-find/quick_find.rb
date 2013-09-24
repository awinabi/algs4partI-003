class QuickFind

  def initialize(n)
    @qf_ary = *(0..n.to_i)
  end
    
  def union(a,b)
    if @qf_ary[a] != @qf_ary[b]
      @qf_ary.each do |i|
        if @qf_ary[i] == @qf_ary[a]
          @qf_ary[i] = @qf_ary[b]
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

