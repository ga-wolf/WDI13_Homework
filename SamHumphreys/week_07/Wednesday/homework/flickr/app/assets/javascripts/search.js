var page = 1;
var pages = 0;
var searchTerm = '';
var searching = 'finished';

$(document).ready(function() {



  var searchFlickr = function (term, page) {
    var flickrURL = 'https://api.flickr.com/services/rest/?jsoncallback=?';
    $.getJSON(flickrURL, {
      method: 'flickr.photos.search',
      api_key: '2f5ac274ecfac5a455f38745704ad084',
      text: term,
      page: page,
      format: 'json'
    }).done(function(data) {
      searching = 'finished';
      console.log(data);
      pages = data.photos.pages;
      $('#totals').text("Total images: " + data.photos.total);
      for (var i = 0; i<data.photos.photo.length; i ++) {
        var url = generateURL(data.photos.photo[i]);
        displayPhoto(url);
      };
    });
  };

  var clearResults = function() {
    $('#totals').html('');
    $('#results').html('');
    searchTerm = '';
    page = 1;
  };

  var displayPhoto = function (url) {
    var $img = $('<img>', {src: url});
    $img.appendTo('#results');
  };

  var generateURL = function ( photo ) {
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

  $('#search').on('submit', function (e) {
    e.preventDefault();
    searching = '';
    clearResults();
    searchTerm = $('#query').val();
    searchFlickr(searchTerm, page);
  });

  $('#reset').on('click', function() {
    console.log('reset clicked');
    $('#query').val('').focus();
    clearResults();
  });

  var fetchThreshold = 1000;

  $(window).on('scroll', function() {
    if (page !== pages) {
      var pixelsFromBottom = $(document).height() - ($(window).scrollTop() + $(window).height());
      if (pixelsFromBottom < fetchThreshold ) {
        if (searching === 'finished') {
          searching = '';
          page += 1;
          console.log('getting page ',page);
          searchFlickr(searchTerm, page);
        };
      };
    };
  });

});
