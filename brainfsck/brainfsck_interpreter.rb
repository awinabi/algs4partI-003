class BrainfsckInterpreter

  def initialize
    @data_ary = []
    @instructions = []
    @current_index = 0
  end

  def operate(operand)
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
    when '['
      if @data_ary[@current_index] == 0
        @current_index = matching_bracket_index('[')
      end
    when ']'
      if @data_ary[@current_index] != 0
        @current_index = matching_bracket_index(']')
      end
    else
      # do nothing
    end
  end


  def process
    @instructions.each do |c| 
      p "#{@data_ary} - #{@current_index}"
      operate(c)
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
  def matching_bracket_index(bracket)
    p "#{@instructions}"
    case bracket
    when '['
      i = @current_index + 1
      while @instructions[i] != ']'
        i = i + 1
      end
      return i
    when ']'
      i = @current_index - 1
      while @instructions[i] != '['
        i = i - 1
      end
      return i
    else
      #do nothing
    end
  end
end

bfi = BrainfsckInterpreter.new
bfi.instruction = "+++++[>+++++[>++++<-]<-]>>+++.--..++++++."
# bfi.data = [103,101,101,107]
bfi.process