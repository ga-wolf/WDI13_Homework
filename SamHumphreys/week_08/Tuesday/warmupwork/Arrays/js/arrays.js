// The goal of this exercise is to manipulate arrays by creating a function that can reverse an array and by creating a function that can flatten an array. Do not use any library functions (i.e. .reverse or .each) to complete this task, write this stuff from scratch!
//
// Make two functions
// reverse
// flatten
// reverse( [1, 2, 3, 4] ); // Should return [ 4, 3, 2, 1 ]
// flatten( ["Hello", ["World", 42] ] ); // Should return [ "Hello", "World", 42 ]
// Only make flatten work to one level deep! You should be able to flatten this - ["Hello", ["World"]] - but not this - ["Hello", [[["World"]]]]
//
// Hint: You're going to need to be looping through the arrays to get a solution.


var reverse = function (array) {
  var reversedArray = [];
  for (var i = array.length-1 ; i >= 0 ; i--) {
    reversedArray.push(array[i]);
  };
  return reversedArray;
};

var flatten = function(array) {
  var flattenedArray = [];
  for ( var i = 0 ; i<array.length ; i++ ) {
    if (typeof(array[i]) !== 'object') {
      flattenedArray.push(array[i]);
    } else {
      for (var j = 0 ; j<array[i].length ; j++ ) {
        flattenedArray.push(array[i][j]);
      };
    };
  };
  return flattenedArray;
};

var array = [1, 2, 3, 4, "Hello", ["World", 42]];
console.log('The original array is:');
console.log(array);
console.log('The reversed array is ' + reverse(array));
console.log('The flattened array is ' + flatten(array));
