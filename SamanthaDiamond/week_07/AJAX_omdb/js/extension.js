var movie = function () {
  var userInput = document.getElementById("searchBar").value
  var url = "http://omdbapi.com?s=" + userInput;
  var request = new XMLHttpRequest(); // State 0
  request.open( "GET", url );
  request.send();
  request.onreadystatechange = function () {
    if (request.readyState === 4) {
      var info = JSON.parse(request.responseText);
      var title = document.getElementById("movieTitle")
      title.innerHTML = info.Title;
      };
    };
  };

  var button = document.getElementById("button");
  button.addEventListener('click', movie);
