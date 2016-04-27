var data;
var search;
var request;

var movieList = document.getElementById('movie-list');
var moviePoster = document.getElementById('movie-poster');






document.querySelector('#search-btn').addEventListener('click', function() {

  search = document.querySelector('#search-input').value;

  request = new XMLHttpRequest();

  request.onreadystatechange = function() {
    if (request.readyState !== 4) {
      return;
    }
    var movieList = document.getElementById('movie-list');

    data = JSON.parse(request.responseText).Search;

    for (var i = 0; i < data.length; i++) {
      console.log(data[i].Title);
      var div = document.createElement('div');
      var a = document.createElement('a');
      a.className = "movie-link";
      a.innerText = data[i].Title;
      a.href = '#';

      a.addEventListener('click', function(event) {
        console.log(i);

        return function(event, iCopy) {
          console.log(iCopy);
          return iCopy;
        };

      });

      movieList.appendChild(div);
      div.appendChild(a);
    }



  };

  request.open('GET', 'http://omdbapi.com/?s=' + search);
  request.send();



});
