class WordProblem

  def initialize(string)
    @string = string
    cleaner
  end

  def cleaner
    @cleaned = @string.match(/What is (-?\d+) (plus|minus|multiplied by|divided by) (-?\d+)\s?((plus|minus|multiplied by|divided by)?\s?(-?\d+))?\?/)
  end

  def first_number
    @cleaned[1].to_i
  end

  def second_number
    @cleaned[3].to_i
  end

  def third_number
    @cleaned[6].to_i
  end

  def first_operator
    case @cleaned[2]
      when 'plus' then :+
      when 'minus' then :-
      when 'divided by' then :/
      when 'multiplied by' then :*
    end
  end

  def second_operator
    case @cleaned[5]
      when 'plus' then :+
      when 'minus' then :-
      when 'divided by' then :/
      when 'multiplied by' then :*
    end
  end

  def answer

    if !complex?
      @answer = first_number.send(first_operator, second_number)
    else
      @answer = first_number.send(first_operator, second_number).send(second_operator, third_number)
    end
  end

  def complex?
    !!cleaner[4]
  end

end

problem = WordProblem.new('What is 1 plus 1 minus 4?')
