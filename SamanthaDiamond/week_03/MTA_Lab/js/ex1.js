/*
MTA Lab
Objectives:
  Apply your knowledge of Javascript to solve a real world problem.
  Get really good at array manipulation.

Activity:
  Create a program that models a simple subway system.

  The program takes the line and stop that a user is getting on at and the line
  and stop that user is getting off at and prints the journey and the total number
  of stops for the trip in the console:

  planTrip('N', 'Times Square', '6', '33rd'); // This is only a suggested function
  name and signature.
    console.log() shows output similar to this:
    "Your must travel through the following stops on the N line: 34th, 28th,
    23rd, Union Square."
    "Change at Union Square."
    "Your journey continues through the following stops: 23rd, 28th, 33rd."
    "7 stops in total."

There are 3 subway lines:
  The N line has the following stops: Times Square, 34th, 28th, 23rd, Union Square,
  and 8th
  The L line has the following stops: 8th, 6th, Union Square, 3rd, and 1st
  The 6 line has the following stops: Grand Central, 33rd, 28th, 23rd, Union Square,
  and Astor Place.
  All 3 subway lines intersect at Union Square, but there are no other intersection
  points. (For example, this means the 28th stop on the N line is different than
  the 28th street stop on the 6 line, so you'll have to differentiate this when
  you name your stops in the arrays.)
  Tell the user the number of stops AND the stops IN ORDER that they will pass
  through or change at.

Hints:
  Work out how you would do it on paper first! Then start to explain that process
  in Javascript.
  Get the program to work for a single line before trying to tackle multiple lines.
  Don't worry about prompting the user for input. Hard code some values to get it
  working. You can use prompt() later to make it more interactive.
  Consider diagramming the lines by sketching out the subway lines and their stops
   and intersection.
  The key to the lab is finding the index positions of each stop. (hint: indexOf())
  Make sure the stops that are the same for different lines have different names
  (i.e. 23rd on the N and on the 6 need to be differentiated)
*/


var lineN = {
  stations: ['Times Square', '34rd', '28th', '23rd', 'Union Square', '8th'],
  travelRoute: [],

  fromStation: function (departure) {
    return lineN.stations.indexOf(departure);
  },

  toStation: function (arrival) {
    return lineN.stations.indexOf(arrival);
  },

  stopsForward: function (departure, arrival) {
    var firstStop = lineN.fromStation(departure);
    var lastStop = lineN.toStation(arrival);
    for (var i = firstStop; i <= lastStop; i++) {
      var currentStation = lineN.stations[i];
      lineN.travelRoute.push(currentStation);
    }
  },

  stopsBackward: function (departure, arrival) {
    var firstStop = lineN.fromStation(departure);
    var lastStop = lineN.toStation(arrival);
    var unionSquare = lineN.stations.indexOf('Union Square');
    for (var i = firstStop; i >= lastStop; i--) {
      var currentStation = lineN.stations[i];
      lineN.travelRoute.push(currentStation);
    }
  },

  goToUnionSquare: function (departure) {
    var arrival = 'Union Square';
    var firstStop = lineN.fromStation(departure);
    var lastStop = lineN.toStation(arrival);
    if (firstStop < lastStop) {
      lineN.stopsForward(departure, arrival);
    } else {
      lineN.stopsBackward(departure, arrival);
    }
  },

  travel: function (departure, arrival) {
    var firstStop = lineN.fromStation(departure);
    var lastStop = lineN.toStation(arrival);
    if (firstStop < lastStop) {
      lineN.stopsForward(departure, arrival);
    } else {
      lineN.stopsBackward(departure, arrival);
    }
  }
};

var lineL = {
  stations: ['8th', '6th', 'Union Square', '3rd', '1st'],
  travelRoute: [],

  fromStation: function (departure) {
    return lineL.stations.indexOf(departure);
  },

  toStation: function (arrival) {
    return lineL.stations.indexOf(arrival);
  },

  stopsForward: function (departure, arrival) {
    var firstStop = lineL.fromStation(departure);
    var lastStop = lineL.toStation(arrival);
    for (var i = firstStop; i <= lastStop; i++) {
      var currentStation = lineL.stations[i];
      lineL.travelRoute.push(currentStation);
    }
  },

  stopsBackward: function (departure, arrival) {
    var firstStop = lineL.fromStation(departure);
    var lastStop = lineL.toStation(arrival);
    var unionSquare = lineL.stations.indexOf('Union Square');
    for (var i = firstStop; i >= lastStop; i--) {
      var currentStation = lineL.stations[i];
      lineL.travelRoute.push(currentStation);
    }
  },

  goToUnionSquare: function (departure) {
    var arrival = 'Union Square';
    var firstStop = lineL.fromStation(departure);
    var lastStop = lineL.toStation(arrival);
    if (firstStop < lastStop) {
      lineL.stopsForward(departure, arrival);
    } else {
      lineL.stopsBackward(departure, arrival);
    }
  },

  travel: function (departure, arrival) {
    var firstStop = lineL.fromStation(departure);
    var lastStop = lineL.toStation(arrival);
    if (firstStop < lastStop) {
      lineL.stopsForward(departure, arrival);
    } else {
      lineL.stopsBackward(departure, arrival);
    }
  }
};

var line6 = {
  stations: ['Grand Central', '33rd', '28th', '23rd', 'Union Square', 'Astor Place'],
  travelRoute: [],

  fromStation: function (departure) {
    return line6.stations.indexOf(departure);
  },

  toStation: function (arrival) {
    return line6.stations.indexOf(arrival);
  },

  stopsForward: function (departure, arrival) {
    var firstStop = line6.fromStation(departure);
    var lastStop = line6.toStation(arrival);
    for (var i = firstStop; i <= lastStop; i++) {
      var currentStation = line6.stations[i];
      line6.travelRoute.push(currentStation);
    }
  },

  stopsBackward: function (departure, arrival) {
    var firstStop = line6.fromStation(departure);
    var lastStop = line6.toStation(arrival);
    var unionSquare = line6.stations.indexOf('Union Square'); //?delete this lines
    for (var i = firstStop; i >= lastStop; i--) {
      var currentStation = line6.stations[i];
      line6.travelRoute.push(currentStation);
    }
  },

  goToUnionSquare: function (departure) {
    var arrival = 'Union Square';
    var firstStop = line6.fromStation(departure);
    var lastStop = line6.toStation(arrival); // i assume we do need this line
    if (firstStop < lastStop) {
      line6.stopsForward(departure, arrival);
    } else {
      line6.stopsBackward(departure, arrival);
    }
  },

  travel: function (departure, arrival) {
    var firstStop = line6.fromStation(departure);
    var lastStop = line6.toStation(arrival);
    if (firstStop < lastStop) {
      line6.stopsForward(departure, arrival);
    } else {
      line6.stopsBackward(departure, arrival);
    }
  }
};

var lines = {
  'N': lineN,
  'L': lineL,
  '6': line6
};

var planTrip = function (L1, S1, L2, S2) {
  lines[L1].travelRoute = [];
  lines[L2].travelRoute = [];
  var numStops = 0;
  if (L1 === L2) {
    lines[L1].travel(S1, S2);
    var stops = lines[L1].travelRoute.slice(1);
    console.log("You must travel through the following stops on the " + L1 + " line: " + stops + ".");
    numStops = stops.length;
    console.log(numStops + " stops in total.");
  }
  if (L1 !== L2) {
    lines[L1].goToUnionSquare(S1);
    lines[L2].travel('Union Square', S2);
    var stops = lines[L1].travelRoute.slice(1);
    var stationsAfterUnionSquare = lines[L2].travelRoute.slice(1);
    console.log("You must travel through the following stops on the " + L1 + " line: " + stops + ".");
    console.log("Change at Union Square.");
    console.log("Your journey continues through the following stops on the " + L2 + " line: " + stationsAfterUnionSquare + ".");
    numStops = stops.length + stationsAfterUnionSquare.length;
    console.log(numStops + " stops in total.");
  }
};
