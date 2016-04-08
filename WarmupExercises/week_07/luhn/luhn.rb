class Luhn

    attr_reader :number
    def initialize(number)
        @number = number
    end

    def luhnify
        # Create an empty array called 'numbers'
        numbers = []

        # We want to work from the right, but we can't call .reverse on a FixNum object. So, we're going to take the number and:
            # Turn it into a string;
            # Reverse that string;
            # Split that string on the empty string (ie, make it an array)
            # Pass each element in the array to the :to_i method
            # For each element in the resulting array, call the element 'd', and call the index of that element 'i'
        number.to_s.reverse.split("").map(&:to_i).each_with_index do |d, i|

            value = i.even? ? d : d * 2
            # That one-liner is fancy Ruby shorthand for:
                # if i % 2 == 0
                #     value = d
                # else
                #     value = d * 2
                # end

            value -= 9 if value > 9
            # That one-liner is fancy Ruby shorthand for:
                # if value > 9
                #     value = value - 9
                # end

            numbers << value
        end
        # Reverse the numbers array so they're in the same order as they started.
        numbers.reverse
    end

    def checksum
        # Take what's returned from .luhnify, 'inject' the .+ method in between each element in the array and, starting with an initial value of 0, reduce that to a single value.
        luhnify.inject(0, :+)
        # Another way to write this which more explicitly shows what's going on would be:
            # luhnify.inject(0) do |sum, num|
            #     sum + num
            # end
        # ie, start with a sum of zero, pass the sum into the block and add num to it, repeat.
    end

    def valid?
        # If the result of checksum is a number that is evenly divisible by 10, it is a valid Luhn number
        if checksum % 10 == 0
            puts "#{number} is a valid Luhn number"
        else
        # If the result of checksum is a number that is NOT evenly divisible by 10:
            # Multiply that number by 10, so that we've got an extra digit for the additional checkdigit;
            # Take the number 10 and add the remainder of (checksum % 10) to that number.
            number = number * 10 + (10 - checksum % 10)
            puts "#{number} would be a valid Luhn number"
        end
    end
end

puts "Enter a number to check"
number = gets.to_i
puts Luhn.new(number).valid?
