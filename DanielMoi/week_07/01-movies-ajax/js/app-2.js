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

      a.addEventListener('click', (function(event, j) {

        console.log("outside");
        console.log(event);
        console.log(j);

        // this becomes my event listener
        // so the first parameter automatically becomes the event
        return function(something, k){
          console.log('something: ' + something); // event object
          console.log('k: ' + k); // undefined
          console.log('j: ' + j); // the saved value of i
          console.log("inside");
          moviePoster.innerHTML = '';
          img = document.createElement('img');
          img.src = data[j].Poster;
          moviePoster.appendChild(img);
          return function() {
            console.log(9);
          }();

        };


      })(event, i));

      movieList.appendChild(div);
      div.appendChild(a);
    }



  };

  request.open('GET', 'http://omdbapi.com/?s=' + search);
  request.send();



});
