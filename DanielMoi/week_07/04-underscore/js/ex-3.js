var numbers = [ 1, 2, 3, 4, 5, 6, 7, 8, 9, 10 ];
var bumpyArr = ["hello", "maytag", [[[["sigmonster"]], "swizzle"]]];
var uncompactedArr = [ "hello", false, NaN, undefined, "quantom bogo-sort" ];

var arrToTransform = [[ "age", "location" ], [ NaN, undefined ]];

// Create an array of every five numbers between 30 and 101
var x = _.range(30, 101, 5);
console.log(x);

// Turn bumpyArr into one flat array (no nested arrays)
var x = _.flatten(bumpyArr);
console.log(x);

// Remove all of the falsey elements in the uncompactedArr
var x = _.reject(uncompactedArr, function(el) {
  return !!el === false;
});
console.log(x);

// Find all of the unique elements in the following arrays - [ 1, 25, 100 ], [ 1, 14, 25 ] and 24, Infinity, -0
var x = _.union([ 1, 25, 100 ], [ 1, 14, 25 ]);
console.log(x);

var x = _.uniq([24, Infinity, -0]);
console.log(x);

// Find the index of the first element in numbers that is over 7 and is even
var x = _.findIndex(numbers, function(number) {
  return number > 7 && number % 2 === 0;
});
console.log(x);

// Turn arrToTransform into an object that looks like this - { age: NaN, location: undefined }
var x = _.object(arrToTransform[0], arrToTransform[1]);
console.log(x);
