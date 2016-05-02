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


var checkIfHappy = function (startingNumber) {
  var numberAsString = startingNumber.toString();
  var newNumberArr = [];
  var loopCount = 0;

  while (numberAsString !== '1' && loopCount < 200) {
    newNumberArr = [];
    for (var i = 0; i < numberAsString.length; i++) {
      var digitAsNumber = Number(numberAsString[i]);
      newNumberArr.push(digitAsNumber * digitAsNumber);
    };
    var totalOfArray = 0;
    for (var i = 0; i < newNumberArr.length; i++) {
      totalOfArray += newNumberArr[i];
    };
    numberAsString = totalOfArray.toString();
    loopCount += 1;
  };
  if (numberAsString === '1') {
    return startingNumber;
  };
};

var happyNumberArray = []

var startingNumber = 1;

while (happyNumberArray.length < 20) {
  var result = checkIfHappy(startingNumber);
  if (result !== undefined) {
    happyNumberArray.push(result);
  };
  startingNumber += 1;
};

console.log('the first 20 happy numbers are: ' + happyNumberArray);
