// Exercises
//

var numbers = [ 1, 2, 3, 4, 5, 6, 7, 8, 9, 10 ];

var people = [
  { id: 1, username: "A", active: true,  age: 20 },
  { id: 2, username: "B", active: false, age: 35 },
  { id: 3, username: "C", active: false, age: 50 },
  { id: 4, username: "D", active: true,  age: 65 },
  { id: 5, username: "E", active: true,  age: 80 },
  { id: 6, username: "E", active: true,  age: 95 },
];

// Iterate through numbers and log each number to the console
// _.each(numbers, function(num) {
//   console.log(num);
// });

// Iterate through numbers and multiply each one of them by 5
// _.each(numbers, function(num) {
//   console.log(num * 5);
// })

// Iterate through numbers and reduce it by adding them together
// var result = _.reduce(numbers, function (sum, num) {
//   return sum + num;
// });
// console.log(result);


// Get an array of all of the people in people that have the username "E"
// var getEarray = _.filter(people, {username: "E"});
// console.log(getEarray);


// Find the first object in people that has the id of 3
// var getEarray = _.findWhere(people, {id:3});
// console.log(getEarray);


// Find the first person who has an age of less than 50
// var youngsters = _.findWhere(people, function (person) {
//   return person.age < 50;
// });
// console.log(youngsters);



// Get an array of all of the people with an age of over 60
// var oldies = _.filter(people, function(person) {
//   return person.age > 60;
// });
// console.log(oldies);


// Remove all of the people with an age less than 40
var middleUp = _.reject(people, function(person) {
  return person.age < 40;
});
console.log(middleUp);
