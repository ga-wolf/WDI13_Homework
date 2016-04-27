var data;
var search;
var request;

var movieList = document.getElementById('movie-list');
var moviePoster = document.getElementById('movie-poster');






document.querySelector('#search-btn').addEventListener('click', function(event) {
  movieList.innerHTML = '';

  search = document.querySelector('#search-input').value;

  request = new XMLHttpRequest();

  request.onreadystatechange = function() {
    if (request.readyState !== 4) {
      return;
    }
    var movieList = document.getElementById('movie-list');

    data = JSON.parse(request.responseText).Search;

    for (var i = 0; i < data.length; i++) {
      var div = document.createElement('div');
      var a = document.createElement('a');
      a.className = "movie-link";
      a.id = i;
      a.innerText = data[i].Title;
      a.href = '#movie-list';

      a.addEventListener('click', (function(event, iCopy) {
        return function(event) {
          var x = document.getElementsByClassName('movie-link');
          a.className = 'movie-link active';
          moviePoster.innerHTML = '';
          img = document.createElement('img');
          img.src = data[iCopy].Poster;
          moviePoster.appendChild(img);
        };
      })(event, i));

      movieList.appendChild(div);
      div.appendChild(a);
    }



  };

  request.open('GET', 'http://omdbapi.com/?s=' + search);
  request.send();



});
