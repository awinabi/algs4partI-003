class BrainfsckInterpreter

  def initialize
    @data_ary = []
    @instructions = []
    @current_index = 0
    @inst_index = 0
  end

  def operate(operand, instruction_idex)
    case operand
    when '>'
      @current_index += 1
    when '<'
      @current_index -= 1
    when '+'
      if @data_ary[@current_index].nil?
        @data_ary[@current_index] = 0
      end
      @data_ary[@current_index] += 1
    when '-'
      if @data_ary[@current_index].nil?
        @data_ary[@current_index] = 0
      end
      @data_ary[@current_index] -= 1
    when '.'
      print @data_ary[@current_index]
      print " "
    when '['
      if @data_ary[@current_index] == 0
        @inst_index = matching_bracket_index('[', instruction_idex)
      else
        @inst_index += 1
      end
    when ']'
      if @data_ary[@current_index] != 0
        @inst_index = matching_bracket_index(']', instruction_idex)
      else
        @inst_index += 1
      end
    else
      # do nothing
    end
  end


  def process
    @instructions.each_index do |i|
      puts "inst index => #{@inst_index} = #{@instructions[@inst_index]} ~ #{@data_ary}"

      if @inst_index != i
        operate(@instructions[@inst_index], @inst_index)
      else
        operate(@instructions[i], i)
      end

      

    end
  end

  def instruction=(instruction_string)
    @instructions = instruction_string.split(//)
  end

  def data=(data_ary)
    @data_ary = data_ary
  end

  def output
    @data_ary.each do |c|
      print c.chr
    end
    puts
  end

  private
  def matching_bracket_index(bracket, i)
    p "#{@instructions}"
    case bracket
    when '['
      while @instructions[i] != ']'
        i = i + 1
      end
      return i
    when ']'
      puts "i => #{i}"
      while @instructions[i] != '['
        i = i - 1
      end
      puts "i => #{i}"
      return i
    else
      #do nothing
    end
  end
end

bfi = BrainfsckInterpreter.new
bfi.instruction = "++++++++++[>+++++++>++++++++++>+++>+<<<<-]>++.>+.+++++++..+++.>++.<<+++++++++++++++.>.+++.------.--------.>+.>."
# bfi.data = [103,101,101,107]
bfi.process

