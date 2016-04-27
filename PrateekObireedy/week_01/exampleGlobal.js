var brosFactory=function(name, instrument, vice){

var bros={
instrument:instrument,
name:name,
vice: vice
};
return bros;
};
var groucho={
name: 'groucho',
instrument: guitar,
vice: 'cigars'
};

var harps=brosFactory('Harpo', 'harp', 'mutism');
var chico=brosFactory('chico', 'piano', 'lechery');
