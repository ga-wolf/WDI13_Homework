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

class Calculator

  def initialize(question)
    @question = question
    matches
  end

  def matches
    #What is 4 plus 6
    #What is 4 divided by 2

    @matches = @question.match(/(\d+) (plus|minus|multiplies by| divided by)  .*(\d+)/)
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

  C = Calculator.new("What is 4 plus 6?")
  puts c.answer
