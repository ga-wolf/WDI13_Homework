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
  "attoparsec", "batch", "Cinderalla Book", "Dr. Fred Mbogo", "eat flaming death", "fandango on core", "Foonly", "goat file", "Halloween Documents", "I see no X here", "Imminent Death Of The Net Predicted!", "jibble", "kilogoogle", "larval stage", "maximum Maytag mode", "nybble", "octal forty", "pico-", "quantum bogodynamics", "rubber-hose cryptanalysis", "sigmonster", "tail recursion", "unswizzle", "VAXen", "webmaster", "XEROX PARC", "yak shaving", "Zero-One-Infinity Rule"
]; // Random words from here... http://www.catb.org/jargon/html/go01.html

// Sort the people by 'uid'
// var sorted = _.sortBy(people, 'uid');
// console.log(sorted);

// Group the random words by the lower case version of their first letter
// var grouped = _.groupBy(words, function(word) {
//   return word.toLowerCase()[0];
// });
// console.log(grouped);

// Check to see if all the words have more than 3 characters
// var longish = _.every(words, function(word) {
//   return word.length > 3;
// });
// console.log(longish);

// Check if some words are over twenty characters long
// var fullyLong = _.some(words, function(word) {
//   return word.length > 20;
// });
// console.log(fullyLong);

// Get an array of all of the uids in people
// var uids = _.pluck(people, 'uid');
// console.log(uids);

// Find the person with the highest uid
// var maxUids = _.max(people, 'uid');
// console.log(maxUids);

// Return an object that says how many even numbers and how many odd numbers there are in numbers
// var sorted = _.countBy(numbers, function (number) {
//   return number % 2 ? 'even' : 'odd';
// })
// console.log(sorted);

// Get three random numbers out of numbers
var random3 = _.sample(numbers, 3);
console.log(random3);
