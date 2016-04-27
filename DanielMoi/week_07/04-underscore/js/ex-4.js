var objectToMap = {
  start:  100,
  middle: 853,
  end:    912
};

// Multiply each value in objectToMap by a random number and return an object with the changed values
var x = _.mapObject(objectToMap, function(value, key) {
  return value * _.random(1, 100);
});
console.log(x);

// Get an array version of objectToMap that looks like this - [["start", 100], ["middle", 853], ["end", 912]]
var x = _.pairs(objectToMap);
console.log(x);

// Flip objectToMap around so that it looks like this - { "100" : "start", "853" : "middle", "912" : "end" }
var x = _.invert(objectToMap);
console.log(x);

// Remove the "start" key from objectToMap in two different ways
var x = _.omit(objectToMap, 'start');
console.log(x);

var x = _.pick(objectToMap, 'middle', 'end');
console.log(x);
