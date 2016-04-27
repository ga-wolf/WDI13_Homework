var objectToMap = {
  start:  100,
  middle: 853,
  end:    912
};

// Multiply each value in objectToMap by a random number and return an object with the
//changed values

var newObject = _.mapObject(objectToMap, function (value, key) {
    return value * Math.random();
});
console.log(newObject);

// Get an array version of objectToMap that looks like this -
// [["start", 100], ["middle", 853], ["end", 912]]

var arrVersion = _.pairs(objectToMap);
console.log(arrVersion);

// Flip objectToMap around so that it looks like this -
// { "100" : "start", "853" : "middle", "912" : "end" }

var inverted = _.invert(objectToMap);
console.log(inverted);

// Remove the "start" key from objectToMap in two different ways

var picked = _.pick(objectToMap, "middle", "end");
console.log(picked);
var omitted = _.omit(objectToMap, "start");
console.log(omitted);
