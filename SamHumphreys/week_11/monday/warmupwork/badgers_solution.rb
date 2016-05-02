class WordProblem

  def initialize(question)
    @question = question
    matches
  end

  def answer
    if too_complicated?
      raise ArgumentError.new('I do not understand the question')
    end
    if !chain?
      @answer = n1.send(operator1, n2)
    else
      @answer = n1.send(operator1, n2).send(operator2, n3)
    end
  end

  def matches
    @matches = @question.match(/What is (-?\d+) (plus|minus) (-?\d+)\s?((plus|minus)?\s?(-?\d+))?\?/)
  end

  def n1
    @matches[1].to_i
  end

  def n2
    @matches[3].to_i
  end

  def n3
    @matches[6].to_i
  end

  def operator1
    case @matches[2]
      when 'plus' then :+
      when 'minus' then :-
      when 'multiplied by' then :*
      when 'divided by' then :/
    end
  end

  def operator2
    case @matches[5]
      when 'plus' then :+
      when 'minus' then :-
      when 'multiplied by' then :*
      when 'divided by' then :/
    end
  end

  def too_complicated?

  end

  def chain?
    !!matches[4]
  end

end

q = WordProblem.new('What is 4 plus 6?')
