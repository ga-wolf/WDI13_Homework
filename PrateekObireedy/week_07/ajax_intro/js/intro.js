var button = document.getElementById("get")


var result = function() {
  var request = new XMLHttpRequest();

  request.onreadystatechange = function() {
    if (request.readyState !== 4) {
      return;
    }

    //.value

    var poster = document.getElementById("poster");
    var info = JSON.parse(request.responseText);

    for (var i = 0; i < info["Search"].length; i++) {
      imgSrc = info["Search"][i].Poster
      poster.innerHTML += "<img src=" + imgSrc + ">"
    }
  }
  var title = document.getElementById("movie")
  var title = title.value;
  console.log(title);
  var link = "http://omdbapi.com/?s=" + title

  request.open("GET", link);
  request.send();

};

button.addEventListener("click", result)
