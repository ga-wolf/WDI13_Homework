var numbers = [ 1, 2, 3, 4, 5, 6, 7, 8, 9, 10 ];
var bumpyArr = ["hello", "maytag", [[[["sigmonster"]], "swizzle"]]];
var uncompactedArr = [ "hello", false, NaN, undefined, "quantom bogo-sort" ];
var arrToTransform = [[ "age", "location" ], [ NaN, undefined ]];


// Create an array of every five numbers between 30 and 101
var fiveNumbers = _.range(30, 101, 5);
console.log(fiveNumbers);

// Turn bumpyArr into one flat array (no nested arrays)
var bumpyArrFlatten = _.flatten(bumpyArr);
console.log(bumpyArrFlatten);

// Remove all of the falsey elements in the uncompactedArr
var removeFalsey = _.compact(uncompactedArr);
console.log(removeFalsey);

// Find all of the unique elements in the following arrays
// - [ 1, 25, 100 ], [ 1, 14, 25 ] and 24, Infinity, -0
var unique = _.uniq([ 1, 25, 100 ], [ 1, 14, 25 ], [24, Infinity, -0]);
console.log(unique);


// Find the index of the first element in numbers that is over 7 and is even
var findIndex = _.findIndex(numbers, function(num){
  if (num > 7 && num % 2 === 0){
    return num ;
  }
});
console.log("Index = ",findIndex);

// Turn arrToTransform into an object that looks like this
//- { age: NaN, location: undefined }
  var toObject = _.object( _.unzip( arrToTransform ) );
  console.log(toObject);
