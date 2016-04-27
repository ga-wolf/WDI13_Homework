require 'pry'

@input_num = 594
@roman_answer = []
@roman_values = {
  'M' => 1000,
  'CM' => 900,
  'CCM' => 800,
  'D' => 500,
  'CD' => 400,
  'C' => 100,
  'XC' => 90,
  'XXC' => 80,
  'L' => 50,
  'XL' => 40,
  'X' => 10,
  'IX' => 9,
  'IIX' => 8,
  'V' => 5,
  'IV' => 4,
  'I' => 1
}

def work_it(num)
  @roman_values.each do |k,v|
    if num - v >= 0
      @input_num -= v
      return k
    end
  end
end

while @input_num > 0
  @roman_answer.push(work_it(@input_num))
end

puts @roman_answer
