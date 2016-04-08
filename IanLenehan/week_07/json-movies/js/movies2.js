window.addEventListener('load', function () {
  var form = document.getElementById('movie-lookup');
  form.addEventListener('submit', function (event) { //using form instead of button allows us to listen to form submission, not just clicking button. Like hitting enter
    event.preventDefault(); // don't let the browser submit the form in the default way

    var movieTitle = document.getElementById('movie-title').value;
    var movieURL = 'http://omdbapi.com/?t=' + movieTitle;

    var request = new XMLHttpRequest();
    request.onreadystatechange = function() {
      if (request.readyState !==4 ) { return };

      var movieInfo = JSON.parse(request.responseText);

      var moviePoster = movieInfo.Poster;
      var image = document.createElement('img');
      image.src = moviePoster;
      document.getElementById('result').innerHTML = '';
      document.getElementById('result').appendChild(image);
    };

    request.open('GET', movieURL);
    request.send();

  });
})
