// Accumulate
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

var items = {
  inputs: [1, 2, 3, 4, 5],
};

var doStuff = {
  squareIt: function(array) {
    var output = [];
    for (var i = 0; i<array.length; i++) {
      numberSquared = array[i] * array[i];
      output.push(numberSquared);
    }
    return output;
  },
  squareRoot: function(array) {
    var output = [];
    for (var i = 0; i<array.length; i++) {
      rootedNumber = Math.sqrt(array[i]);
      output.push(rootedNumber);
    }
    return output;
  },
  cubeIt: function(array) {
    var output = [];
    for (var i = 0; i<array.length; i++) {
      cubedNumber = Math.pow(array[i], 3);
      output.push(cubedNumber);
    }
    return output;
  },
  checkIfEven: function(array) {
    var output = [];
    for (var i = 0; i<array.length; i++) {
      if (array[i] % 2 === 0) {
        output.push(true);
      } else {
        output.push(false);
      }
    }
    return output;
  },
  runIt: function(array) {
    console.log('Original: ' + array);
    console.log('Squared: ' + doStuff.squareIt(array));
    console.log('Rooted: ' + doStuff.squareRoot(array));
    console.log('Cubed: ' + doStuff.cubeIt(array));
    console.log('Is it even? ' + doStuff.checkIfEven(array));
  }
};

doStuff.runIt(items.inputs);
