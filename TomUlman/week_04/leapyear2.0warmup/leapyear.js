// Write a function that will take any given year and return whether it is a leap year or not. Remember that a leap year is:
//
// Every year that is evenly divisible by 4
// Except if it is evenly divisible by 100...
// Unless it is also divisible by 400
// Test Data... Make sure it is working!
//
// 1997 is not a leap year, it should return false
// 1996 is a leap year, it should return true
// 1900 is not a leap year, it should return false
// 2000 is a leap year, it should return true
// How to structure it...
//
// We want a custom function called isLeapYear
// Bonus!
//
// Ask the user what number they want to test
// Watch a whole heap of information about leap years...

//LOGIC

var leapYear = function(input) {
  var year = parseInt(input);
  var not =  year + " is not a leap year";
  var is = year + " is a leap year";

  if (year % 4 === 0) {
    if (year % 400 === 0) {
      console.log(is);
      return true;
    }
  }else if ((year % 4 === 0) && (year % 100 !== 0)) {
return true;

  } else {
return false;

 }
};

// UI

// var input = prompt("place your year here!");
// leapYear(input);
$( "button" ).click(function() {
  var year = ($(".isLeapYear").val()
if
  }
});
