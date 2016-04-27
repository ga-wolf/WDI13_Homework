var startingData = [
  [["groucho", "marx", 1990], ["firstName", "lastName", "born"]],
  [["chico",   "marx", 1987], ["firstName", "lastName", "born"]],
  [["zeppo",   "marx", 2001], ["firstName", "lastName", "born"]],
  [["harpo",   "marx", 1988], ["firstName", "lastName", "born"]],
  [["gummo",   "marx", 1992], ["firstName", "lastName", "born"]]
];

// Groucho Marx was born in 1890.
// Chico Marx was born in 1887.
// Zeppo Marx was born in 1901.
// Harpo Marx was born in 1888.
// Gummo Marx was born in 1892.

var x = _.map(startingData, function(el) {
  return _.unzip(el);
});
console.log(x);

var y = _.map(x, function(el) {
  return _.object(el);
});
console.log(y);

var z = _.map(y, function(el) {
  return _.invert(el);
});
console.log(z);

var a = _.map(z, function(el) {
  return _.mapObject(el, function(value, key) {
    return isNaN(value) ? _.first(value).toUpperCase() + _.rest(value).join('') : value - 100;
  });
});
console.log(a);

var templateString = "<%= firstName %> <%= lastName %> was born in <%= born %>";
var template = _.template(templateString);
_.each(a, function(el) {
  console.log(template( { firstName: el.firstName, lastName: el.lastName, born: el.born }));
});
