//1 Iterate through numbers and log each number to the console
//2 Iterate through numbers and multiply each one of them by 5
//3 Iterate through numbers and reduce it by adding them together
//4 Get an array of all of the people in people that have the username "E"
//5 Find the first object in people that has the id of 3
//6 Find the first person who has an age of less than 50
//7 Get an array of all of the people with an age of over 60
//8 Remove all of the people with an age less than 40

var numbers = [ 1, 2, 3, 4, 5, 6, 7, 8, 9, 10 ];

var people = [
  { id: 1, username: "A", active: true,  age: 20 },
  { id: 2, username: "B", active: false, age: 35 },
  { id: 3, username: "C", active: false, age: 50 },
  { id: 4, username: "D", active: true,  age: 65 },
  { id: 5, username: "E", active: true,  age: 80 },
  { id: 6, username: "E", active: true,  age: 95 },
];

//1
 _.each( numbers, function (num) {
  console.log( num );
});

//2
_.map( numbers, function (num) {
  return num * 5;
});

//3
_.reduce( numbers, function (sum, num) {
  return sum + num;
}, 0 ); // => 6

//4
_.where( people, { username: "E" } );     // => [{ id: 23, ... }, { id: 24, ... }]

//5
_.findWhere( people, { id: 3 } );     // => [{ id: 23, ... }

//6
_.find( people, function ( person ) {
  return person.age < 50;
});

//7
_.filter( people, function ( person ) {
  return person.age > 60;
});

//8
_.reject( people, function ( person ) {
  return person.age > 40;
});
