
// Write a function that will take any given year and return whether it is a leap year or not. Remember that a leap year is:

// Every year that is evenly divisible by 4
// Except if it is evenly divisible by 100...
// Unless it is also divisible by 400

$(document).ready(function() {

  // LOGIC

  var isLeapYear = function(year) {
    if (((year % 4) === 0) && (((year % 100) !== 0) || ((year % 400) === 0))) {
      return true;
    } else {
      return false;
    }
  }

  // UI

  $("button").on("click", function() {
    var year = $(".leapYear").val()
    if (isLeapYear(year) === true) {
      $(".result").text("Yep, that's a leap year");
    } else {
      $(".result").text("Nope, not a leap year");
    }
  });
});
