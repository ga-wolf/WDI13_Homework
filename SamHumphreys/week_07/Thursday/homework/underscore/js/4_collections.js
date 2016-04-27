var objectToMap = {
  start:  100,
  middle: 853,
  end:    912
}


// Multiply each value in objectToMap by a random number and return an object with the changed values
// var values = _.mapObject(objectToMap, function (values, keys) {
//   return values * Math.random();
// });
// console.log(values);

// Get an array version of objectToMap that looks like this - [["start", 100], ["middle", 853], ["end", 912]]
// console.log(_.pairs(objectToMap));

// Flip objectToMap around so that it looks like this - { "100" : "start", "853" : "middle", "912" : "end" }
// console.log(_.invert(objectToMap));

// Remove the "start" key from objectToMap in two different ways
console.log(_.pick(objectToMap, 'middle', 'end'));
console.log(_.omit(objectToMap, 'start'));
