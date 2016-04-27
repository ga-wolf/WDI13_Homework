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

var Seive = {
  range: [],
  makeArray: function (lower, upper) {
    for (var i = lower; i <= upper; i ++) {
      Seive.range.push(i);
    }
  },
  checkPrimes: function () {
    for (var i = 0; i < this.range.length; i ++) {
      for (var j = i + 1; j < this.range.length; j ++) {
        if (this.range[j]/this.range[i] % 1 === 0) {
          this.range.splice(j,1);
        }
      }
    }
    console.log(this.range);
  }
}

Seive.makeArray(2,25);
Seive.checkPrimes();


// var data = {
//   lowerLimit: 2,
//   upperLimit: 10,
//   range: []
// }
//
//
// for (var i = 0; i < data.range.length; i ++) {
//   for (var j = i + 1; j < data.range.length; j ++) {
//     if (data.range[j]/data.range[i] % 1 === 0) {
//       data.range.splice(j,1);
//     }
//   }
// }
// console.log("Here are the prime numbers between " + data.lowerLimit +" and "+ data.upperLimit);
// for (var i = 0; i < data.range.length; i ++) {
//   console.log(data.range[i]);
// }
