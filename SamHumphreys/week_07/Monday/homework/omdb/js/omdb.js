var request = new XMLHttpRequest();

request.onreadystatechange = function() {
  if (request.readyState !== 4) {
    return
  }
  Poster = JSON.parse(request.responseText).Poster;
  var container = document.getElementsByClassName('container')[0];
  var img = document.createElement('p')
  img.className = 'poster';
  img.innerHTML = "<img src='" + Poster + "'>";
  container.appendChild(img);
};

var button = document.getElementsByClassName('button')[0];
button.addEventListener('click', function() {
  if (document.getElementsByClassName('poster').length !== 0) {
    picture = document.getElementsByClassName('poster')[0];
    picture.parentNode.removeChild(picture);
  }
  movie = document.getElementsByClassName('movieInput')[0].value;
  request.open('GET', 'http://omdbapi.com/?t='+movie);
  request.send();
});
