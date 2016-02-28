// There are 3 subway lines:
// The N line has the following stops: Times Square, 34th, 28th, 23rd, Union Square, and 8th
// The L line has the following stops: 8th, 6th, Union Square, 3rd, and 1st
// The 6 line has the following stops: Grand Central, 33rd, 28th, 23rd, Union Square, and Astor Place.

// setup arrays for network and trip details
var mta = [{
    name: 'n',
    stops: ['Times Square', '34th', '28th', '23rd', 'Union Square', '8th']},
    {name: 'l',
    stops: ['8th', '6th', 'Union Square', '3rd', '1st']},
    {name: '6',
    stops: ['Grand Central', '33rd', '28th', '23rd', 'Union Square',
          'Astor Place']}
]

//tripPlan takes the start and stop lines and stations and populates the
//trip

var trip = {
  startLine: '',
  startStation: '',
  stopLine: '',
  stopStation: '',
  savedLine: '',
  savedStop: '',
  tripDetails: [],
  tripExplaination: [],
  totalStops: 0,
  tripPlan: function(firstLine, firstStation, endLine, endStation) {
    trip.startLine = decipher.getLine(firstLine);
    trip.startStation = decipher.getStop(trip.startLine, firstStation);
    trip.stopLine = decipher.getLine(endLine);
    trip.stopStation = decipher.getStop(trip.stopLine, endStation);
  },
  tripMake: function () {
                if (trip.startLine === trip.stopLine && trip.startStation ===
                      trip.stopStation) {
                  trip.samePlace();
                } else if (trip.startLine === trip.stopLine) {
                  trip.singleLine();
                } else if (trip.startLine !== trip.stopLine) {
                  trip.multiLine();
                }
  },
  samePlace:  function () {
                trip.tripExplaination.push('You\'re already at your ' +
                                            'destination... *mutters under ' +
                                            'breath*.');
                decipher.inEnglishPlease();
  },
  singleLine: function () {
                if (trip.startStation < trip.stopStation) {
                  for (var i = trip.startStation + 1; i <= trip.stopStation; i++) {
                    trip.tripDetails.push([trip.startLine, i]);
                  }
                 trip.totalStops += trip.stopStation - trip.startStation;
                } else {
                  for (var i = trip.startStation-1; i >= trip.stopStation; i--) {
                    trip.tripDetails.push([trip.startLine, i]);
                  }
                 trip.totalStops -=  trip.stopStation - trip.startStation;
                }
                trip.tripDetails.pop();
                decipher.convertBack();
                decipher.inEnglishPlease();
                trip.tripExplaination.push('Get off the train at ' +
                              mta[trip.stopLine].stops[trip.stopStation] +
                              ' station.');
                decipher.inEnglishPlease();
                trip.tripDetails = [];
  },
  multiLine:  function () {
    trip.savedLine = trip.stopLine
    trip.savedStop = trip.stopStation;
    trip.stopLine = trip.startLine;
    trip.stopStation = decipher.getStop(trip.startLine, 'Union Square');
    trip.tripMake();
    trip.tripExplaination.push('Change to the ' +
                                mta[trip.savedLine].name + ' line.');
    trip.startLine = trip.savedLine;
    trip.startStation = decipher.getStop(trip.startLine, 'Union Square');
    trip.stopLine = trip.savedLine;
    trip.stopStation = trip.savedStop;
    trip.tripMake();
  }
}

var decipher = {
  getLine:          function (input) {
                      for (var i = 0; i<mta.length; i++) {
                        if (mta[i].name === input) {
                          return i;
                        }
                      }
                      return 'not a line on MTA';
                    },
  getStop:          function (lineCode, stopName) {
                      for (var i = 0; i<mta[lineCode].stops.length; i++) {
                        if (stopName === mta[lineCode].stops[i]) {
                          return i;
                        }
                      }
                      return 'not a stop on line ' + lineCode;
                    },
  convertBack:      function () {
                      if (trip.tripDetails.length === 0) {
                        trip.tripExplaination.push('Go one stop on the ' + mta[trip.startLine].name + ' line.');
                      } else {
                        trip.tripExplaination.push('Go through these stations on the ' + mta[trip.startLine].name + ' line:');
                      }
                      for (var i = 0; i<trip.tripDetails.length; i++) {
                        var stopDetails = trip.tripDetails[i];
                        trip.tripExplaination.push(mta[stopDetails[0]].stops[stopDetails[1]]);
                      }
                    },
  inEnglishPlease:  function () {
                      var plainEnglish = '';
                      for (var i = 0; i<trip.tripExplaination.length; i++) {
                        plainEnglish += trip.tripExplaination[i] + ' ';
                      }
                      console.log(plainEnglish);
                      trip.tripExplaination = [];
                },
  goSomewhere:      function () {
                      trip.totalStops = 0;
                      var inputStartLine = prompt('What is your starting line?');
                      var inputStartStop = prompt('What is your starting station?');
                      var inputStopLine = prompt('What is your destination line?');
                      var inputStopStop = prompt('What is your destination station?');

                      trip.tripPlan(inputStartLine, inputStartStop, inputStopLine, inputStopStop);
                      trip.tripMake();
                      console.log(trip.totalStops + ' stops in total');
                    },
}

//Add validation for input

//add formatting to split the trip onto several lines
