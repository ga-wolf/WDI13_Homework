var startingData = [
  [["groucho", "marx", 1990], ["firstName", "lastName", "born"]],
  [["chico",   "marx", 1987], ["firstName", "lastName", "born"]],
  [["zeppo",   "marx", 2001], ["firstName", "lastName", "born"]],
  [["harpo",   "marx", 1988], ["firstName", "lastName", "born"]],
  [["gummo",   "marx", 1992], ["firstName", "lastName", "born"]]
];

//First step is restructuring each one of the nested arrays (_.unzip will help). For example:
startingData = _.map(startingData, function(arr){
  return _.invert( _.object( _.unzip(arr) ) );
});

var templateString =  "<%= firstName %> <%= lastName %> was born in <%= born %>.";
var template = _.template( templateString );
_.each(startingData, function (person) {
  var compiledTemplate = template( person );
  console.log(compiledTemplate);
});



// // startingData = _.unzip(startingData[1]);
// console.log(startingData);
//
// //You then need to turn them into an object (_.object will help).
// startingData =_.object(startingData);
// console.log(startingData);
//
// //You then need to flip that object around (_.invert will help).
// startingData = _.invert(startingData);
// console.log(startingData);

//You then need to change each value in that object.
// If the value can be turned into a number, you need to minus 100 from it.
// If it can't be, you need to make the first letter a capital


// startingData = _.mapObject(startingData, function(value, key){
//     if(_.isNaN(parseInt(value)) ===  true){
//       return value.charAt(0).toUpperCase() + value.slice(1);
//     }else {
//       return parseInt(value) - 100;
//
//     }
// });
// console.log(startingData);


//After that, for each object in the startingData, you need to create a template
// (_.template will help) that receives an object, and console.log a string that
// looks something like this:
//
