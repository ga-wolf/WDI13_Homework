// Happy Numbers
// A happy number is defined by the following process:
//
// Starting with any positive integer,
// replace the number by the sum of the squares of its digits,
// repeat the process until the number equals 1 (where it will stay),
// or it loops endlessly in a *repeating* cycle which does not include 1.
//
// Those numbers for which this process ends in 1 are happy numbers,
// while those for which this process do not end in 1 are unhappy numbers.
// Task
//
// Your task is to write a program in Javascript which prints the first 10 happy numbers, starting from 1.
//
// Here are the first 10 happy numbers, for you to compare your output against:
//
// 1
// 7
// 10
// 13
// 19
// 23
// 28
// 31
// 32
// 44

var found = 0;

for(var i = 1; found < 10; i++) {
  if( happy(i) ) {
    found++;
    console.log('happy #' + found + ' = ' + i);
  }
}

function happy(num) {

  var cycle = [];
  var square_sum = num;

  while(true){
    square_sum = sum_of_digit_squares(square_sum);

    if(square_sum == 1){
      return true;
    }

    if(cycle[square_sum] === true) {
      return false;
    }

    cycle[square_sum] = true;
  }
}

function sum_of_digit_squares(num){

  var numstr = num.toString();
  var sum = 0;

  var i = numstr.length;
  while(i--){
    sum += +numstr[i] * +numstr[i];
  }

  return sum;

}
Here's an official solution, using mathy modulus tricks to get the individual digits of a number, instead of treating the number as a string. However, it's a little harder to work out what this code is doing.

function happy(number) {
    var m, digit ;
    var cycle = [] ;

    while(number != 1 && cycle[number] !== true) {
        cycle[number] = true ;
        m = 0 ;
        while (number > 0) {
            digit = number % 10 ;
            m += digit * digit ;
            number = (number  - digit) / 10 ;
        }
        number = m ;
    }
    return (number == 1) ;
}

var cnt = 8 ;
var number = 1 ;

while(cnt-- > 0) {
    while(!happy(number))
        number++ ;
    document.write(number + " ") ;
    number++ ;
}
