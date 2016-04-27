//DOC READY - HTML LOADED
document.addEventListener("DOMContentLoaded", function(event) {
  document.getElementById('submit').onclick = function() {

    var request = new XMLHttpRequest();
    var movieName = ('http://omdbapi.com/?t=' + document.getElementById('movie').value);

    request.onreadystatechange = function() {
      if (request.readyState !== 4) {
        return;
      }

      var content = document.getElementById('content');
      var info = JSON.parse(request.responseText);
      content.innerHTML = info.Title;

      var poster = document.getElementById('poster');
      info = JSON.parse(request.responseText);
      poster.src = info.Poster;

    };

    request.open('GET', movieName);
    request.send();

  };
});


//BUTTON 

// var form = document.getElementById('content');
// form.addEventListener('submit', function (event) {
// event.preventDefault(); // Prevents browser from submitting form
//   });
