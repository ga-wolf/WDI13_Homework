var button = document.getElementById('search');

var showMovie = function() {
  var userMovie = document.getElementById('movieName').value ;
  var url = 'http://omdbapi.com/?t=' + userMovie;
  var request = new XMLHttpRequest();

  request.open('GET', url);
  request.send();

  request.onreadystatechange = function() {
    if (request.readyState !== 4){
    return;
    }
    var info = JSON.parse(request.responseText);
      var moviePoster = document.getElementById('moviePoster');
      moviePoster.src = info.Poster;

      var movieTitle = document.getElementById('movieTitle');
      movieTitle.innerHTML = info.Title;

      var moviePlot = document.getElementById('moviePlot');
      moviePlot.innerHTML = info.Plot;
    };
};

button.addEventListener('click', showMovie);
