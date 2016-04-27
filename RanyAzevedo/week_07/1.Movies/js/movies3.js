

var button = document.getElementById('search');

var showList = function() {
    var userMovie = document.getElementById('movieName').value ;
    var url = 'http://omdbapi.com/?s=' + userMovie;
    var request = new XMLHttpRequest();

    request.open('GET', url);
    request.send();

    request.onreadystatechange = function() {
      if (request.readyState !== 4){
      return;
     }
      var list = JSON.parse(request.responseText);
      var listMovies = list.Search;
      for (var i = 0; i < listMovies.length; i++) {
        movie = listMovies[i];
        console.log(movie.Title);
        var listAll = document.createElement("li");
        listAll.innerHTML = "<a href=" + "http://omdbapi.com?i=" + movie.imdbID  + '>' + movie.Title + '</a>';
        var allMovies = document.getElementById("moviesList");
        allMovies.appendChild(listAll);
      }
   };
};

button.addEventListener('click', showList);
