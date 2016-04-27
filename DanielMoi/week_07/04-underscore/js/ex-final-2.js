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

_.chain(startingData)
  .map(function(el) {
  return _.unzip(el);
})
.map(function(el) {
  return _.object(el);
})
.map(function(el) {
  return _.invert(el);
})
.map(function(el) {
  return _.mapObject(el, function(value, key) {
    return isNaN(value) ? _.first(value).toUpperCase() + _.rest(value).join('') : value - 100;
  });
})
.each(function(el) {
  var templateString = "<%= firstName %> <%= lastName %> was born in <%= born %>";
  var template = _.template(templateString);
  console.log(template( { firstName: el.firstName, lastName: el.lastName, born: el.born }));
});
