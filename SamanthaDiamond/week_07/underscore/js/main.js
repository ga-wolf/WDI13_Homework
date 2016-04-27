// COLLECTIONS!

  // var numbers = [ 1, 2, 3, 4, 5, 6, 7, 8, 9, 10 ];
  //
  // var people = [
  //   { id: 1, username: "A", active: true,  age: 20 },
  //   { id: 2, username: "B", active: false, age: 35 },
  //   { id: 3, username: "C", active: false, age: 50 },
  //   { id: 4, username: "D", active: true,  age: 65 },
  //   { id: 5, username: "E", active: true,  age: 80 },
  //   { id: 6, username: "E", active: true,  age: 95 },
  // ];

// Iterate through numbers and log each number to the console
var logNum = _.each(numbers, function(num) {
  return num;
});

// Iterate through numbers and multiply each one of them by 5
var multiplyByFive = _.each(numbers, function(num) {
  return num * 5;
});

// Iterate through numbers and reduce it by adding them together
var reduceNums = _.reduce(numbers, function(sum, num) {
  return sum + num;
}, 0);
// console.log(reduceNums);

// Get an array of all of the people in people that have the username "E"
var usernameE = _.where(people, {username: "E"});
// console.log(usernameE);

// Find the first object in people that has the id of 3
var firstPersonId3 = _.findWhere(people, {id: 3});
// console.log(firstPersonId3);

// Find the first person who has an age of less than 50
var firstPersonLessThan50 = _.find(people, function(v) {
  return v.age < 50;
})
// console.log(firstPersonLessThan50);

// Get an array of all of the people with an age of over 60
var agedOver60 = _.filter(people, function(v) {
  return v.age > 60;
});
// console.log(agedOver60);

// Remove all of the people with an age less than 40
var removePeopleLessThan40 = _.reject(people, function(v) {
  return v.age < 40;
});
// console.log(removePeopleLessThan40);


// COLLECTIONS cont.

var numbers = [ 1, 2, 3, 4, 5, 6, 7, 8, 9, 10 ];

var people = [
  { id: 1, username: "A", active: true,  age: 20, uid: 1412 },
  { id: 2, username: "B", active: false, age: 35, uid: 1352 },
  { id: 3, username: "C", active: false, age: 50, uid: 5418 },
  { id: 4, username: "D", active: true,  age: 65, uid: 216  },
  { id: 5, username: "E", active: true,  age: 80, uid: 18   },
  { id: 6, username: "E", active: true,  age: 95, uid: 1000 },
];

var words = [
  "attoparsec", "batch", "Cinderalla Book", "Dr. Fred Mbogo", "eat flaming death", "fandango on core", "Foonly", "goat file",
  "Halloween Documents", "I see no X here", "Imminent Death Of The Net Predicted!", "jibble", "kilogoogle", "larval stage",
  "maximum Maytag mode", "nybble", "octal forty", "pico-", "quantum bogodynamics", "rubber-hose cryptanalysis", "sigmonster",
  "tail recursion", "unswizzle", "VAXen", "webmaster", "XEROX PARC", "yak shaving", "Zero-One-Infinity Rule"
]; // Random words from here... http://www.catb.org/jargon/html/go01.html

// Sort the people by 'uid'
var sort = _.sortBy(people, "uid");
// console.log(sort);

// Group the random words by the lower case version of their first letter
var group = _.groupBy(words, function(word) {
  word = word.toLowerCase();
  return _.first(word);
});
// console.log(group);

// Check to see if all the words have more than 3 characters
var wordLength = _.every(words, function(word) {
  return word.length >= 3;
});
// console.log(wordLength);

// Check if some words are over twenty characters long
var longWords = _.some(words, function(word) {
  return word.length > 20;
});
// console.log(longWords);

// Get an array of all of the uids in people
var arrayOfUids = _.pluck(people, "uid");
// console.log(arrayOfUids);

// Find the person with the highest uid
var highestUid = _.max(arrayOfUids);
// console.log(highestUid);

// Return an object that says how many even numbers and how many odd numbers there are in numbers
var oddOrEven = _.countBy(numbers, function(num) {
  return num % 2 === 0 ? 'even' : 'odd';
});
// console.log(oddOrEven);

// Get three random numbers out of numbers
var randomNums = _.sample(numbers, 3);
// console.log(randomNums);


// ARRAYS!

var numbers = [ 1, 2, 3, 4, 5, 6, 7, 8, 9, 10 ];

var bumpyArr = ["hello", "maytag", [[[["sigmonster"]], "swizzle"]]];

var uncompactedArr = [ "hello", false, NaN, undefined, "quantom bogo-sort" ];

var arrToTransform = [[ "age", "location" ], [ NaN, undefined ]];


// Create an array of every five numbers between 30 and 101
var resultingArray = _.range(30, 101, 5);
// console.log(resultingArray);

// Turn bumpyArr into one flat array (no nested arrays)
var flatArray = _.flatten(bumpyArr);
// console.log(flatArray);

// Remove all of the falsey elements in the uncompactedArr
var rmFalseyElements = _.compact(uncompactedArr);
// console.log(rmFalseyElements);

// Find all of the unique elements in the following arrays - [ 1, 25, 100 ], [ 1, 14, 25 ] and 24, Infinity, -0
var uniqueElements = _.union([ 1, 25, 100 ], [ 1, 14, 25 ], [24, "Infinity", -0]);
// console.log(uniqueElements);

// Find the index of the first element in numbers that is over 7 and is even
var result = _.findIndex(numbers, function(v) {
  return v > 7 && v % 2 === 0;
});
// console.log(result);

// Turn arrToTransform into an object that looks like this - { age: NaN, location: undefined }
var convertArrToObject = _.object( _.unzip( arrToTransform ) );
// var convertArrToObject = _.object(arrToTransform[0], arrToTransform[1]);
// console.log(convertArrToObject);

// OBJECTS!

var objectToMap = {
  start:  100,
  middle: 853,
  end:    912
};

// Multiply each value in objectToMap by a random number and return an object with the changed values
var mappedObj = _.mapObject(objectToMap, function(v, k) {
  return v * _.random(1, 10);
})
// console.log(mappedObj);

// Get an array version of objectToMap that looks like this - [["start", 100], ["middle", 853], ["end", 912]]
var toArray = _.pairs(objectToMap);
// console.log(toArray);

// Flip objectToMap around so that it looks like this - { "100" : "start", "853" : "middle", "912" : "end" }
var invertObj = _.invert(objectToMap);
// console.log(invertObj);

// Remove the "start" key from objectToMap in two different ways
var removeStartKeyOpt1 = _.omit(objectToMap, "start");
// console.log(removeStartKeyOpt1);
var removeStartKeyOpt2 = _.pick(objectToMap, "middle", "end");
// console.log(removeStartKeyOpt2);


// Utilities, Functions and Chaining!

var people = [
  { id: 1, username: "A", active: true,  age: 20, uid: 1412 },
  { id: 2, username: "B", active: false, age: 35, uid: 1352 },
  { id: 3, username: "C", active: false, age: 50, uid: 5418 },
  { id: 4, username: "D", active: true,  age: 65, uid: 216  },
  { id: 5, username: "E", active: true,  age: 80, uid: 18   },
  { id: 6, username: "E", active: true,  age: 95, uid: 1000 }
];

var startingData = [
  [["groucho", "marx", 1990], ["firstName", "lastName", "born"]],
  [["chico",   "marx", 1987], ["firstName", "lastName", "born"]],
  [["zeppo",   "marx", 2001], ["firstName", "lastName", "born"]],
  [["harpo",   "marx", 1988], ["firstName", "lastName", "born"]],
  [["gummo",   "marx", 1992], ["firstName", "lastName", "born"]]
];

// Log out 30 random numbers between 20 and 100
var range = _.range(20, 100);
var randomNums = _.sample(range, 30);
// console.log(randomNums);

// Create a function that can only ever be called once


// Append a paragraph tag to the body for every person in people. It should end up looking something like this - <p>
// Hello A, you don't look a day over 20 </p>
