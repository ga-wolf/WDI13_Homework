// where is the info
// what is the URL

// call of this

// click handler for click of search button
// then .value the search result

// var userInput = "";
//
// var url ="http://omdbapi.com?t=" + userInput;
//
// var request = new XMLHttpRequest();
// request.open( "GET", url);
// request.send();
//
// request.onreadystatechange = function () {
//   if (request.readyState === 4) {
//     var info = JSON.parse ( request.responseText )
//     console.log(request.responseText['Title']);
//   console.log ( request.readyState);
//   }
// };

$(document).ready(function () {

  var getMovie = function (event) {
    event.preventDefault();
    var userInput = $('#movieTitle').val();



    var url ="http://omdbapi.com?t=" + userInput;


    var request = new XMLHttpRequest();
    request.open( "GET", url);
    request.send();

    request.onreadystatechange = function () {
      if (request.readyState === 4) {
        var info = JSON.parse( request.responseText )
        console.log(info['Title']);
      console.log ( request.readyState);
      }
    };
  }

  $('button').on('submit', getMovie);
});
