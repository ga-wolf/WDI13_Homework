// The Sieve of Eratosthenes
// The Sieve of Eratosthenes is a simple, ancient algorithm for finding all prime numbers up to any given limit.
//
// Create your range, starting at two and ending at the given limit.
//
// The algorithm consists of repeating the following over and over:
//
// take the next available unmarked number in your list (it is prime)
// remove all the multiples of that number (they are not prime)
// Repeat until you don't have any possible primes left in your range.
//
// When the algorithm terminates, all the numbers in the list that have not been removed are prime.
//
// Do this in Javascript!
console.log("Math is cool");
///////////////////////// YOUR BROKEN AND I HATE YOU /////////////////////////////////////
///////////////////////// YOUR BROKEN AND I HATE YOU /////////////////////////////////////
// numberArray = [];
// //
// // Range = function(number){
// // for (i = 2; i < number; i++)
// // numberArray.push(i);
// // console.log(numberArray);
// // };
//
//
// Prime = function(number) {
//
//   for (i = 2; i < number; i++) {
//   numberArray.push(i);
// }
//
// for (i = 0; i<numberArray.length; i++) {
//   for (j = i + 1; j<numberArray.length; j++) {
//     if (numberArray[i] % numberArray[j] === 0) {
//       numberArray.splice(j, 1);
//     }
//   }
// }
// console.log(numberArray);
// return numberArray;
// };
///////////////////////// YOUR BROKEN AND I HATE YOU /////////////////////////////////////
///////////////////////// YOUR BROKEN AND I HATE YOU /////////////////////////////////////

var Sieve = {

createRange: function (starNumber, endNumber) {
  var numbers = [];
  for (var i = starNumber; i <= endNumber; i++) {
    numbers.push( i );
  }
  return numbers;
},

findPrimes: function (starNumber, endNumber) {
  var possibilities = this.createRange(starNumber, endNumber);

  var primeArray = [];

while (possibilities.length > 0) {
var prime = possibilities.shift();

primeArray.push( prime );

  possibilities = possibilities.filter(function (num) {
     return num % prime !== 0;
  });
}

console.log( primeArray );

}

};

Sieve.findPrimes(2,10);
