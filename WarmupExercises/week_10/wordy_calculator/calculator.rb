class Calculator

    def initialize(question)
        @question = question
        matches
    end

    def matches
        # See http://ruby-doc.org/core-2.1.4/Regexp.html for more on the .match
        @matches = @question.match(/(\d+) (plus|minus|multiplied by|divided by) (\d+)/)
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
            when "multiplied by" then :*
            when "divided by" then :/
        end
    end

    def answer
        # See http://ruby-doc.org/core-2.3.0/Object.html#method-i-send for more on the .send method
        @answer = first_number.send(operation, second_number)
    end
end

c = Calculator.new("What is 10 minus 6?")
puts c.answer
