# This is Test Driven Development at it's finest - we've been given a bunch of tests, and we've got to write code to make those tests pass. You might look at the tests and think "what? That's not an area code" or "why would we return ten zeros if the number's invalid? Do we really hate the person with the number 0000000000 and want to pepper them in SMSs?" - it doesn't matter.

# We're going to use the tests as a starting point and let that guide the code we write. We're going to write JUST ENOUGH code to make a test pass, then move on to the next test and repeat.

#We're going to create a class called "Phone", because that's what the tests are expecting us to do.


class Phone

    # If we don't have an attr_reader, we're going to a 'NoMethodError: undefined method `number'' error when we run the tests.
    attr_reader :number

    def initialize(number)
        @number = clean(number)
    end

    def clean(number)
        # The gsub method takes two arguments - a pattern and a replacement - and returns a string replacing all pattern matches with the replacement.
        number = number.gsub(/[^0-9]/, "")
        valid(number)
    end

    def area_code
        number[0..2]
    end

    def middle
        number[3..5]
    end

    def last
        # I really wanted to use 'end' here, but it's a reserved word.
        number[6..9]
    end

    def to_s
        "(#{area_code}) #{middle}-#{last}"
    end

    # Thanks to The Hammer for this cleaner, alternative 'to_s' method:
    # def to_s
    #     @number =~ /(\d{3})(\d{3})(\d+)/
    #     return "(#{$1}) #{$2}-#{$3}"
    # end
    
    # And this absolute face-melter that I can't get my head around:
    # def to_s
    #     match =~ @number.match(/regex/)
    #     area, prefix, rest = match.captures
    #     return "(#{area}) #{prefix}-#{rest}"
    # end

    def valid(number)
        # REQUIREMENT: If the phone number is 11 digits and the first number is not 1, then it is a bad number
        # REQUIREMENT: If the phone number is 11 digits and the first number is 1, trim the 1 and use the first 10 digits
        if number.length == 11 && number.start_with?("1")
            number[1..10]
        # REQUIREMENT: If the phone number is 10 digits assume that it is good
        elsif number.length == 10
            return number
        else
        # REQUIREMENT: If the phone number is more than 11 digits assume that it is a bad number
        # REQUIREMENT: If the phone number is less than 10 digits assume that it is bad number
            return "0" * 10
        # Why are we returning 10 zeroes if it's a bad number?? Because that's what the tests are expecting! Doesn't make sense? Doesn't matter! This is the beating heart of Test Driven Development right here.
        end
    end
end
