var people = [
  { id: 1, username: "A", active: true,  age: 20, uid: 1412 },
  { id: 2, username: "B", active: false, age: 35, uid: 1352 },
  { id: 3, username: "C", active: false, age: 50, uid: 5418 },
  { id: 4, username: "D", active: true,  age: 65, uid: 216  },
  { id: 5, username: "E", active: true,  age: 80, uid: 18   },
  { id: 6, username: "E", active: true,  age: 95, uid: 1000 }
];

// Log out 30 random numbers between 20 and 100
_.times(30, function() {
  console.log(_.random(20, 100));
});

// Create a function that can only ever be called once
var infinite = function() {
  console.log('infinite has been called');
};
var onceOnly = _.once(infinite);
onceOnly();
onceOnly();

// Append a paragraph tag to the body for every person in people. It should end up looking something like this - <p> Hello A, you don't look a day over 20 </p>
var templateString = "<p> Hello <%= name %>, you don't look a day over <%= age %> </p>";
var template = _.template( templateString );
_.each(people, function(person) {
  console.log(template( { name: person.username, age: person.age }));
});
