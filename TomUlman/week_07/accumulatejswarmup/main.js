// For example, given the collection of numbers:
//
// 1, 2, 3, 4, 5
// And the operation:
//
// square a number
// Your code should be able to produce the collection of squares:
//
// 1, 4, 9, 16, 25
// Optional Extras
//
// Square Root a Number
// Cube a number
// Even and Odd
// Or return an object containing all of those things:
//
// {
//   original: [1, 2, 3, 4, 5],
//   squares: [...],
//   squareRoots: [...],
//   cubes: [...],
//   evenAndOdd: [true, false, true]
// }
// Restrictions
//
// Keep your hands off that collect/map/fmap/whatchamacallit functionality provided by your standard library!
//
// Solve this one yourself using other basic tools instead.


//BADGERS SOLUTION

var input = [5, 7, 8, 9];
var squares = [];
var cubes = [];
var roots = [];

//get square numbers
var square = function(n) {
  squares.push(n * n);
};

// get cube of numbers

//get square root of numbers
var root = function(n) {
  roots.push(Math.sqrt(n));
};


//create an each function to help out
var each = function(array, callback) {
  for (var i =0; i < array.length; i++) {
    var element = array[i];
    callback(element);
  }
};

each(input, square);







//FUCKTHIS?>>>A:SD

// var square = function(input) {
//   var numberArray = input.split(",").map(Number);
//
//   for (var i = 0; i < numberArray.length; i++) {
//     squareNumber = Math.pow((numberArray[i]), 2);
//     console.log(  squareNumber );
//   }
// };
// square(1,2,3,4,5);
