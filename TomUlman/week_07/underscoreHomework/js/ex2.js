//1 Sort the people by 'uid'
//2 Group the random words by the lower case version of their first letter
//3 Check to see if all the words have more than 3 characters
//4 Check if some words are over twenty characters long
//5 Get an array of all of the uids in people
//6 Find the person with the highest uid
//7 Return an object that says how many even numbers and how many odd numbers there are in numbers
//8 Get three random numbers out of numbers


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

//1
_.sortBy(people, 'uid');

//2
_.groupBy( words, function(char) {
  return (char).toLowerCase;
});

//3
_.every( words, function ( chars ) {
  return chars.length > 3;
});

//4
_.some( words, function ( chars ) {
  return chars.length > 20;
});

//5
_.pluck( people, 'uid' );

//6
_.max( people, 'uid' );

//7
_.countBy(numbers, function(num) {
  return num % 2 === 0 ? 'even': 'odd';
});

//8
_.sample( numbers, 3 );
