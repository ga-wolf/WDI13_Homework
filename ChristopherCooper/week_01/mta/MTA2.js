var routes = [
      {
        name: 'N',
        stops:['Time Square', '34th Street', '28th Street', '23rd Street', 'Union Square', '8th Street']
      },
      {
        name: 'L',
        stops: ['8th Street', '6th Street', 'Union Square', '3rd Street', '1st Street']
      },
      {
        name: '6',
        stops: ['Grand Central', '33rd Street', '28th Street', '23rd Street', 'Union Square', 'Astor Place']
      }
];


var u = 0; // index of startingStation
var v = 0; // index of Union Square on that line
var w = 0; // index of starting Line

var x = 0; // index of endStation
var y = 0; // index of Union Square on that Line
var z = 0; // index of ending line

var startLeg = [];
var endLeg = [];



var planRoute = function(startLine, startingStation, endLine, endStation){
      getStart(startLine, startingStation);
      getEnd(endLine, endStation);
      getStartLeg();
      getEndLeg();

    if (w === z){
      console.log('Start at ' + startingStation + ' on the ' +
      startLine + ' Line, through ' + startLeg + ' and get off at ' + endStation);
    }
    else if (u - v === 1 || v + 1 === u){
      console.log('Start at ' + startingStation + ' change at ' + ' Union Square ' +
      ' continue through to line ' + endLine + ' and get off at ' + endStation);
    }
    else {
      console.log('Start at ' + startingStation + ' on line ' + startLine + ' through stations '
      + startLeg + ' change at Union Sqaure then proceed through to ' + endLeg +
       ' and get off at ' + endStation + ' on line ' + endLine);
    }
};


/* loops through the routes array objects and sets the index of the given
    startLine to var w & the index of Union Sqaure on this line to var y
*/
var getStart = function(startLine, startingStation){
    for (var i = 0; i < routes.length; i++){
      if (startLine === routes[i].name){
        for (var j = 0; j < routes[i].stops.length; j++){
          if (startingStation === routes[i].stops[j]){
            u = routes[i].stops.indexOf(startingStation);
            v = routes[i].stops.indexOf('Union Square');
            w = i;
          }
        }
      }
    }
  };

/* loops through the routes array objects and sets the index of the given
    endLine to var x & the index of Union Square on this line to var z
*/
var getEnd = function(endLine, endStation){
  for (var i = 0; i < routes.length; i++){
    if (endLine === routes[i].name){
      for (var j = 0; j < routes[i].stops.length; j++){
        if (endStation === routes[i].stops[j]){
          x = routes[i].stops.indexOf(endStation);
          y = routes[i].stops.indexOf('Union Square');
          z = i;
        }
      }
    }
  }
};

var getStartLeg = function (){
  if (u < v){ //u = starting station , v = union square
    for (var i = u + 1; i < v; i++){
      startLeg.push(routes[w].stops[i]);
    }
  } else if (v < u){
    for (var j = u - 1; j > v; j--){
      startLeg.push(routes[w].stops[j]);
    }
  }
   else {
     for (var k = u + 1; k < y; k++){
       startLeg.push(routes[w].stops[k]);
     }
   }
};

var getEndLeg = function (){
  if (x < y){ //x = end station station , y = union square
    for (var i = y - 1; i > x; i--){
      endLeg.push(routes[z].stops[i]);
    }
  } else {
    for (var j = y + 1; j < x; j++){
      endLeg.push(routes[z].stops[j]);
    }
  }
};
