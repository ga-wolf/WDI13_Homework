$(document).ready(function() {

var requestInProgress = false;
var endOfResults = false;
var query;

  var searchFlickr = function(term) {
    if (requestInProgress || endOfResults) { return; }
    requestInProgress = true;
    console.log('fetching page', currentPage, 'for', term);
    var flickrURL = 'https://api.flickr.com/services/rest/?jsoncallback=?';
    $.getJSON(flickrURL, {
      method: 'flickr.photos.search',
      api_key: '2f5ac274ecfac5a455f38745704ad084',
      text: term,
      per_page: 50,
      page: currentPage++,
      format: 'json'
    }).done(function(data) {
      if (data.photos.page === data.photos.pages) {
        endOfResults = true;
      }
      for (var i = 0; i < data.photos.photo.length; i++) {
        var url = generateURL(data.photos.photo[i]);
        displayPhoto(url);
      }
    });
    requestInProgress = false;
  };

  var displayPhoto = function(url) {
    var $img = $('<img>', {
      src: url
    });
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

var currentPage = 1;
  $('#search').on('submit', function(e) {
    e.preventDefault();

    query = $('#query').val();

    $('#results').empty();
    currentPage = 1;
    endOfResults = false;
    searchFlickr(query);
  });

   var throttleControl = function() {
     var pixelsFromBottom = $(document).height() - ( $(window).scrollTop() + $(window).height())
     if (pixelsFromBottom < 500) {
       $(searchFlickr);
     }
   }
   var throttled = _.throttle(throttleControl, 1000)
   $(window).scroll(throttled);

  });
