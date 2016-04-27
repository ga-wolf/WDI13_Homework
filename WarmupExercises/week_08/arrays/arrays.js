// TEST DATA

arrayOne = ["one", "two", "three", "four", "five", "six"];
arrayTwo = [
    "one",
    "two",
    ["two-one", "two-two", "two-three"],
    "three",
    "four"
];

// REQUIREMENT 1: TAKE AN ARRAY AND FLATTEN IT

// Create a function that takes an array as an argument
var flatten = function(arr) {

    // Start with an empty array that we can add elements to and return.
    var flattened = [];
    // Go through each of the elements in the array passed into the function and do stuff.
    for (var i = 0; i < arr.length; i++) {
        // Check to see if the arr[i] element is itself an array.
        // The convoluted test below is necessary due to the fact that only instanceof will only validate arrays that have been created in the same context using the array literal. To catch other arrays, we need to use Object.prototype.toString. For more, see this article: http://javascript.crockford.com/remedial.html
        if ((arr[i] instanceof Array || (Object.prototype.toString.call(arr[i]) == '[object Array]'))) {
            // If arr[i] is itself an array, go through each element of that array and...
            for (var j = 0; j < arr[i].length; j++) {
                // ...push arr[i][j] to the flattened array.
                flattened.push(arr[i][j]);
            }
        // If the arr[i] element is not itself an array...
        } else {
            // ...just push the element itself to the flattened array.
            flattened.push(arr[i]);
        }
    }
    console.log(flattened);
    return flattened;
};

// REQUIREMENT 2: TAKE AN ARRAY AND REVERSE ITS ELEMENTS

// Create a function that takes an array as an argument...
var reverse = function(arr) {

    // Start with an empty array that we can add elements to and return.
    var reversed = [];

    // Go through each element of the array we've passed into the function and...
    for (i = 0; i < arr.length; i++) {
        // Add it to the start of the reversed array. This will reverse the order of the elements.
        reversed.unshift(arr[i]);
    }
    console.log(reversed);
    return reversed;
};

// Call the two functions passing in the test data.
reverse(arrayOne);
flatten(arrayTwo);
