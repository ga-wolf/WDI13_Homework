var objectToMap = {
  start:  100,
  middle: 853,
  end:    912
};

// Multiply each value in objectToMap by a random number and return an
//object with the changed values
var multiply = _.mapObject(objectToMap, function(value, key){
  return value * Math.random();
});
console.log(multiply);

// Get an array version of objectToMap that looks like this
//- [["start", 100], ["middle", 853], ["end", 912]]
var toArray = _.pairs(objectToMap);
console.log(toArray);

// Flip objectToMap around so that it looks like this
// - { "100" : "start", "853" : "middle", "912" : "end" }
var flip = _.invert(objectToMap);
console.log(flip);

// Remove the "start" key from objectToMap in two different ways
var remove = _.omit(objectToMap, "start");
console.log(remove);

var remove2 = _.pick(objectToMap, "middle", "end");
console.log(remove2);
