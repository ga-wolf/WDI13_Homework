//1 Create an array of every five numbers between 30 and 101
//2 Turn bumpyArr into one flat array (no nested arrays)
//3 Remove all of the falsey elements in the uncompactedArr
//4 Find all of the unique elements in the following arrays - [ 1, 25, 100 ], [ 1, 14, 25 ] and 24, Infinity, -0
//5 Find the index of the first element in numbers that is over 7 and is even
//6 Turn arrToTransform into an object that looks like this - { age: NaN, location: undefined }

var numbers = [ 1, 2, 3, 4, 5, 6, 7, 8, 9, 10 ];
var bumpyArr = ["hello", "maytag", [[[["sigmonster"]], "swizzle"]]];
var uncompactedArr = [ "hello", false, NaN, undefined, "quantom bogo-sort" ];

var arrToTransform = [[ "age", "location" ], [ NaN, undefined ]];


//1
_.range(30, 101, 5);

//2
_.flatten(bumpyArr);

//3
_.compact(uncompactedArr);

//4
_.union([ 1, 25, 100 ], [ 1, 14, 25 ], [24, Infinity, -0]);

//5
_.indexOf(numbers, 8);
//I think this is cheating maybe

//6
_.object([ "age", "location" ], [ NaN, undefined ]);
