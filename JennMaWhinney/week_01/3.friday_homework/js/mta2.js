
var subway = {
    nLine: ['Times Square', '34th', '28th', '23rd', 'Union Square', '8th'],
    lLine: ['8th', '6th', 'Union Square', '3rd'],
    sixLine: ['Grand Central', '33rd', '28th', '23rd', 'Union Square',
        'Astor Place'
    ]
};

var startStopNumber;
var endStopNumber;
var totalStops = 0;

var planTrip = function(lineNameDeparture, lineStationDeparture,    /*See original method below, didn't work terribly well*/
    lineNameArrival, lineStationArrival) {
    if (!subway[lineNameDeparture]) {
        console.log("The departure line is invalid");
        return;
    }
    if (!subway[lineNameDeparture].includes(lineStationDeparture)) {
        console.log("The departure station is invalid");
        return;
    }
    if (!subway[lineNameArrival]) {
        console.log("The arrival line is invalid");
        return;
    }
    if (!subway[lineNameArrival].includes(lineStationArrival)) {
        console.log("The arrival station is invalid");
        return;
    } else {

    startStopNumber = subway[lineNameDeparture].indexOf(lineStationDeparture);
    endStopNumber = subway[lineNameArrival].indexOf(lineStationArrival); /* why does it log -1 when I write subway.lineNameBoarding.indexOf...  */
    console.log('Your departure line is: ' + lineNameDeparture);
    console.log('Your departure station is:  ' + lineStationDeparture);
    console.log('Your arrival line is: ' + lineNameArrival);
    console.log('Your arrival station is: ' + lineStationArrival);
    compareInitialLineToFinalLine(lineNameDeparture, lineNameArrival);
}
// planTrip('nLine', 'Times Square', 'sixLine', 'Astor Place'); //I was trying to use this code to do the above work but it wasn't working, this is the general idea//
//
// if((lineNameDeparture) !== ('lLine' || 'nLine' || 'sixLine')){
//   console.log("The departure line is invalid");
// };
// if((lineStationDeparture) !== ('Times Square' || '34th' || '28th' || '23rd'
// || 'Union Square' || '8th' ||'6th' || '3rd' || 'Grand Central' ||
// '33rd' || 'Astor Place')){
//   console.log("The departure station is invalid");
// }
// if((lineNameArrival) !== ('nLine' || 'lLine' || 'sixLine')){
//   console.log("The arrival line is invalid");
// }
// if((lineStationArrival) !== ('Times Square' || '34th' || '28th' ||
// '23rd' || 'Union Square' || '8th' ||'6th' || '3rd' || 'Grand Central' || '33rd' || 'Astor Place')){
//   console.log("The arrival station is invalid");
// }
};

var compareInitialLineToFinalLine = function(startLine, endLine) {
    if (startLine === endLine) {
        if (startStopNumber === endStopNumber) {
            console.log('You are already at your destination!');
        } else {
            sameLine(startLine);
        }
    } else {
        logToUnion(startLine);
        logFromUnion(endLine);
    }

};

var sameLine = function(lineName) {
    console.log("Stay on this train! It will take you to your destination");
    if (startStopNumber <= endStopNumber) {
        for (var i = startStopNumber; i <= endStopNumber; i++) {
            console.log(subway[lineName][i]);
            totalStops++;
        }
        console.log('These are your total stops: ' + totalStops);
    } else {
        for (var n = startStopNumber; n >= endStopNumber; n--) {
            console.log(subway[lineName][n]);
            totalStops++;
        }
        console.log('These are your total stops: ' + totalStops);
    }
};

var logToUnion = function(lineName) {
    console.log('These are the stops to Union Square: ');
    if (startStopNumber < subway[lineName].indexOf("Union Square")) {
        for (var j = startStopNumber; j <= subway[lineName].indexOf("Union Square"); j++) {
            console.log(subway[lineName][j]);
            totalStops++;
        }
    } else {
        for (var k = startStopNumber; k >= subway[lineName].indexOf("Union Square"); k--) {
            console.log(subway[lineName][k]);
            totalStops++;
        }
    }
};

var logFromUnion = function(lineName) {
    console.log('Change at Union Square and continue your journey on the ' + lineName + '. Your stops will be: ');
    if (endStopNumber <= subway[lineName].indexOf("Union Square")) {
        for (var l = subway[lineName].indexOf("Union Square") - 1; l >= endStopNumber; l--) {
            console.log(subway[lineName][l]);
            totalStops++;
        }
        console.log('Your total number of stops is: ' + (totalStops - 1));
    } else {
        for (var m = subway[lineName].indexOf("Union Square") + 1; m <= endStopNumber; m++) {
            console.log(subway[lineName][m]);
            totalStops++;
        }
        console.log('These are your total stops: ' + totalStops);
    }
};
planTrip('nLine', 'Union Square', 'sixLine', 'Union Square');
