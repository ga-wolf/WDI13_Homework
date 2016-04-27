var getSearch = function () {
  $('.search').addClass('hide');
  $('img').remove('.select');
  $('p').remove('.select');
  $('.result').addClass('hide');

  var search = $('#search_title').val();
  var url = 'http://omdbapi.com/?s=' + search;
  var request = new XMLHttpRequest();

  request.onreadystatechange = function() {
    if (request.readyState !== 4) {
        return;
    }
    var info = JSON.parse(request.responseText);
      $('.search').removeClass('hide');
      for (var i = 0; i < info.Search.length; i++) {
          if (info.Search[i].Poster !== "N/A") {
            $('.search').append("<img src='" + info.Search[i].Poster +"' class='thumb select' id='" + info.Search[i].imdbID + "' >");
          }
          $('.search').append("<p class='select' id='" + info.Search[i].imdbID + "'>" + info.Search[i].Title + "</p>");
      }
      $('.select').on("click", getMovie);
    };

  request.open('GET', url);

  request.send();
};

var getMovie = function () {
  var imdbID = $(this).attr('id');
  var url = 'http://omdbapi.com/?i=' + imdbID;
  var request = new XMLHttpRequest();

  request.onreadystatechange = function() {
    if (request.readyState !== 4) {
        return;
    }
    var info = JSON.parse(request.responseText);
    $('.search').addClass('hide');
    $('.result').removeClass('hide');
    $('#result-title').text(info.Title);
    $('#result-year').text(info.Year);
    $('#result-plot').text(info.Plot);
    if (info.Poster !== "N/A") {
      $('#result-poster').attr('src', info.Poster);
    }
  };

  request.open('GET', url);

  request.send();


};

$('#search_button').on("click", getSearch );
