$(document).ready(function() {

  var pageNow = 1;
  var pendingScroll = false;

  var searchFlickr = function(term) {
    var flickrURL = 'https://api.flickr.com/services/rest/?jsoncallback=?';
    $.getJSON(flickrURL, {
      //define what page is loaded here
      method: 'flickr.photos.search',
      api_key: '2f5ac274ecfac5a455f38745704ad084',
      text: term,
      format: 'json',
      // per_page: 100,
      page: pageNow

    }).done(function(data) {
      for (var i = 0; i < data.photos.photo.length; i++) {
        var url = generateURL(data.photos.photo[i]);
        displayPhoto(url);
      }
      pendingScroll = false;
      pageNow ++;
      console.log("THIS IS THE", pageNow);
    });
  };

  var displayPhoto = function(url) {
    var $img = $('<img>', {src: url});
    $img.appendTo('#results');
  };

  var generateURL = function(photo) {
    return [
      'http://farm',
      photo.farm,
      '.static.flickr.com/',
      photo.server,
      '/',
      photo.id,
      '_',
      photo.secret,
      '_q.jpg'
    ].join('');
  };

  $('#search').on('submit', function(e) {
    e.preventDefault();
    var query = $('#query').val();
    $('#results').empty();
    currentPage =1;
    searchFlickr(query);


  });

// reduce amount that this fires
// can use a variable so that it is only fired when a previous call of it is not still working
  $(window).on('scroll', function () {
    var pixelsFromBottom = $(document).height() - ($(window).scrollTop() + $(window).height());
    // console.log('scroll', pixelsFromBottom);


    if ((pixelsFromBottom < 500) && (pendingScroll === false)) {
    pendingScroll = true;
    var query = $('#query').val();
    searchFlickr(query);
    }

  });

});
