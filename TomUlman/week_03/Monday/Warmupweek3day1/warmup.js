// The sum of the squares of the first ten natural numbers is,
//
// 1**2 + 2**2 + ... + 10**2 = 385
//
// The square of the sum of the first ten natural numbers is,
//
// (1 + 2 + ... + 10)**2 = 55**2 = 3025
//
// Hence the difference between the sum of the squares of the first ten natural numbers and the square of the sum is 3025 - 385 = 2640.
//
// Make it so that it doesn't just work for the number 10.


var squareDifference = function (number) {
var sumOfSquares = 0;
var squareOfSums = 0;
var addedSquares = 0;

for (i = 0; i < number + 1; i++) {
var currentSum = Math.pow(i, 2);
sumOfSquares = sumOfSquares + currentSum;
}
for (j = 0; j < number + 1; j++) {
addedSquares = addedSquares + j;
squareOfSums = Math.pow(addedSquares, 2);
}
var finalDifference = (squareOfSums - sumOfSquares);
console.log(finalDifference);

};
