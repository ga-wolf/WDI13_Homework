# Create an array of the days of the week
#
# Create a variable named days_of_the_week as an array of the following:
# Monday
# Tuesday
# Wednesday
# Thursday
# Friday
# Saturday
# Sunday
# 2. My calendar says the first day is Sunday...
#
# Remove Sunday from the last postion and move it to the first position. Use array methods.
# 3. Create a new array of the days of the week:
#
# The first inner array should be the weekdays
# The second inner array should be the weekend days
days = days_of_the_week [ [days_of_the_week[6] , [days_of_the_week[0] ], days_of_the_week[1..5]]
# 4. Remove either the weekdays or the weekends
days.flatten!.sort!
# Your choice...
days.flatten!.sort!
# 5. Sort the remaining days alphabetically

days_of_the_week = %w{Monday Tuesday Wednesday Thursday Friday Saturday Sunday}

#accesses pry to debug


# days_of_the_week.unshift days_of_the_week.pop - alright but doesn't read well
days_of_the_week.rotate! -1


puts days_of_the_week

 # require 'pry'
 # binding.pry
