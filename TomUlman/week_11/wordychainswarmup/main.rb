
class WordProblem

  def initialize(question)
    @question = question
    matches
  end

  def answer
    if too_complicated?
      raise ArgumentError.new("I don't understand the question")
  end

if !chain?
  @answer = n1.send(operator1, n2)
else
  @answer.send(operator1, n2).send(operator2, n3)
end
end
  def matches
    @matches = @question.match(/(-?\d+) (plus|minus|multiplied\sby|divided\sby) (-?\d+)\?? ?(plus|minus|multiplied\sby|divided\sby)? ?(-?\d+)?\??/)
  end

  def n1
    matches[1].to_i
  end

  def n2
    matches[3].to_i
  end

  def n3
    matches[6].to_i
  end

  def operator1
    matches[2] == 'plus' ? :+ : :- # if matches 2 is plus then it is + method else - method
  end

  def operator2
    matches[5] == 'plus' ? :+ : :-
  end

  def too_complicated?

  end

end

q = WordProblem.new("What is 4 plus 6?")
