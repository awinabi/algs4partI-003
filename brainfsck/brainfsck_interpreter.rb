class BrainfsckInterpreter

  def initialize
    @data_ary = []
    @instructions = []
    @out = []
    @data_index = 0
    @inst_index = 0
  end

  def operate(operand, instruction_idex)
    case operand
    when '>'
      @data_index = @data_index + 1
      @inst_index += 1
    when '<'
      @data_index = @data_index - 1
      @inst_index += 1
    when '+'
      if @data_ary[@data_index].nil?
        @data_ary[@data_index] = 0
      end
      @data_ary[@data_index] += 1
      @inst_index += 1
    when '-'
      if @data_ary[@data_index].nil?
        @data_ary[@data_index] = 0
      end
      @data_ary[@data_index] -= 1
      @inst_index += 1
    when '.'
      @out << @data_ary[@data_index]
      @inst_index += 1
    when '['
      if @data_ary[@data_index] == 0
        @inst_index = matching_closing_bracket(instruction_idex)
      else
        @inst_index += 1
      end
    when ']'
      if @data_ary[@data_index] != 0
        @inst_index = matching_opening_bracket(instruction_idex)
      else
        @inst_index += 1
      end
    else
      # do nothing
    end
  end


  def process
    while @inst_index < @instructions.length do
      puts "inst index => #{@inst_index} / #{@instructions[@inst_index]} / #{@data_ary}"
      operate(@instructions[@inst_index], @inst_index)
    end
  end

  def instruction=(instruction_string)
    @instructions = instruction_string.split(//)
  end

  def data=(data_ary)
    @data_ary = data_ary
  end

  def output
    @out.each do |c|
      print c.chr
    end
  end

  def matching_closing_bracket(i)
    mcount = 1
    k = i+1
    while(mcount != 0) do
      puts "k #{k} #{@instructions[k]}"
      puts "mcount #{mcount}"
      case @instructions[k]
      when '['
        mcount = mcount+1
      when ']'
        mcount = mcount-1
      else
      end
      k = k+1
    end
    return k-1
  end

  def matching_opening_bracket(i)
    mcount = 1
    k = i-1
    while(mcount != 0) do
      puts "k #{k} #{@instructions[k]}"
      puts "mcount #{mcount}"
      case @instructions[k]
      when ']'
        mcount = mcount+1
      when '['
        mcount = mcount-1
      else
      end
      k = k-1
    end
    return k+1
  end

end

bfi = BrainfsckInterpreter.new
bfi.instruction = "++++++++++[>+++++++>++++++++++>+++>+<<<<-]>++.>+.+++++++..+++.>++.<<+++++++++++++++.>.+++.------.--------.>+.>."
# bfi.instruction = "+++++[>+++++[>++++<-]<-]>>+++.--..++++++."
bfi.process
puts "---------------------------------------------"
bfi.output
# bfi.data = [103,101,101,107]
# puts "matching ] bracket #{bfi.matching_closing_bracket(10)}"
# puts "matching [ bracket #{bfi.matching_opening_bracket(33)}"


