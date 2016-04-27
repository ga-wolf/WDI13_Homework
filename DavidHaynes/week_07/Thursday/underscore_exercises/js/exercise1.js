var numbers = [ 1, 2, 3, 4, 5, 6, 7, 8, 9, 10 ];

var people = [
  { id: 1, username: "A", active: true,  age: 20 },
  { id: 2, username: "B", active: false, age: 35 },
  { id: 3, username: "C", active: false, age: 50 },
  { id: 4, username: "D", active: true,  age: 65 },
  { id: 5, username: "E", active: true,  age: 80 },
  { id: 6, username: "E", active: true,  age: 95 },
];

// Exercises
//
// Iterate through numbers and log each number to the console

// _.each(numbers, function(num) {
//     console.log(num);
// });

// Iterate through numbers and multiply each one of them by 5

var test = _.map(numbers, function(num) {
    return num * 5;
});
console.log(test);

// Iterate through numbers and reduce it by adding them together

var total = _.reduce(numbers, function(sum, num) {
    return sum + num;
});
console.log(total);

// Get an array of all of the people in people that have the username "E"

var theEs = _.where(people, {username: "E"});
console.log(theEs);

// Find the first object in people that has the id of 3

var theID3 = _.findWhere(people, {id: 3});
console.log(theID3);

// Find the first person who has an age of less than 50

// var youngPeople = _.filter(people, function(person) {
//     return person.age < 50;
// });
// console.log(youngPeople);
var youngPerson = _.find(people, function(person) {
    return person.age < 50;
});
console.log(youngPerson);

// Get an array of all of the people with an age of over 60

var oldPeople = _.filter(people, function(person) {
    return person.age > 60;
});
console.log(oldPeople);

// Remove all of the people with an age less than 40

var over40 = _.reject(people, function(person) {
    return person.age < 40;
});
console.log(over40);
