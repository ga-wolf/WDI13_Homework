# Write some code that takes word problems in the following formats:
#
# What is 5 plus 13?
#
# What is 7 minus 5?
#
# What is -6 multiplied by 4?
#
# What is 25 divided by -5?
# and returns the answer as an integer.


# def calculate(array)
#   first_number = array[2].to_i
#   second_number = array.last.to_i
#   operator = array[3]
#
#   case operator
#   when 'plus'
#     return first_number + second_number
#   when 'minus'
#     return first_number - second_number
#   when 'multiplied'
#     return first_number * second_number
#   when 'divided'
#     return first_number / second_number
#   end
#
# end
#
# puts "Enter the calculation as a phrase: "
# input = gets.chomp
# input_to_array = input.split(' ')
# puts calculate(input_to_array)


class Calculator

  def initialize(question)
    @question = question
    matches
  end

  def matches
    @matches = @question.match(/ (\d+) (plus|minus|mutliplied by|divided by) (\d+) /)
  end

  def first_number
    @matches[1].to_i
  end

  def second_number
    @matches[3].to_i
  end

  def operation
    case @matches[2]
      when 'plus' then :+
      when 'minus' then :-
      when 'multiplied by' then :*
      when 'divided by' then :/
    end
  end

  def answer
    @answer = first_number.send(operation, second_number)
  end
end

c = Calculator.new("What is 4 plus 6?")
puts c.answer
