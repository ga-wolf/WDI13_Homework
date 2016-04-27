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
_.each(numbers, function(n) {
  console.log(n);
});

// Iterate through numbers and multiply each one of them by 5
var x = _.map(numbers, function(n) {
  return n * 5;
});
console.log(x);

// Iterate through numbers and reduce it by adding them together
var x = _.reduce(numbers, function(total, n) {
  return total + n;
}, 0); // explicitly set the starting total to be 0
console.log(x);

// Get an array of all of the people in people that have the username "E"
var x = _.where(people, { username: 'E' });
console.log(x);

// Find the first object in people that has the id of 3
var x = _.findWhere(people, { id: 3 });
console.log(x);

// Find the first person who has an age of less than 50
var x = _.find(people, function(obj) {
  return obj.age < 50;
});
console.log(x);

// Get an array of all of the people with an age of over 60
var x = _.filter(people, function(obj) {
  return obj.age > 60;
});
console.log(x);

// Remove all of the people with an age less than 40
var x = _.reject(people, function(obj) {
  return obj.age < 40;
});
console.log(x);
