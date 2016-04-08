// Set up an object with our global variables
var Results = {
  input: [5,7,8,9],
  squares: [],
  roots: [],
  cubes: []
};

// Get square of numbers
var square = function(n) {
  Results.squares.push(n * n);
};

// Get cube of numbers
var cube = function(n) {
  Results.cubes.push(n * n);
};
// Get square root of numbers
var root = function(n) {
  Results.roots.push(Math.sqrt(n));
};

// Create a callback function to help us out.
var each = function(array, callback) {
  for (var i = 0; i < array.length; i++) {
    var element = array[i];
    callback(element);
  }
};

each(Results.input, square);
each(Results.input, cube);
each(Results.input, root);
console.log(Results);
