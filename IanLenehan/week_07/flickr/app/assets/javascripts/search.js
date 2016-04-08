$(document).ready(function() {

  var counter = 0;
  var page = 1;
  var pages = 0;
  var query;
  var nextImage;
  var prevImage;

  var searchFlickr = function(term) {

    var flickrURL = 'https://api.flickr.com/services/rest/?jsoncallback=?';
    $.getJSON(flickrURL, {
      method: 'flickr.photos.search',
      api_key: '2f5ac274ecfac5a455f38745704ad084',
      text: term,
      format: 'json',
      page: page
    }).done(function(data) {
      counter = 0;
      pages = data.photos.pages;
      for (var i = 0; i < data.photos.photo.length; i++) {
        var url = generateURL(data.photos.photo[i]);
        var fullUrl = generateFullURL(data.photos.photo[i]);
        var next = (i + 1); // so I can pick the next image for slideshow purposes
        var prev = 0;
        if (i > 0) {
          prev = i - 1;
        } else {
          prev = 0;
        };
        nextImage = generateFullURL(data.photos.photo[next]);
        prevImage = generateFullURL(data.photos.photo[prev]);
        displayPhoto(url, fullUrl, nextImage, prevImage);
      };
    });
  };

  var displayPhoto = function(url, fullUrl, nextImage, prevImage) {
    var $img = $('<img>', {
      "src": url, "data-fullurl": fullUrl, "data-nextimage": nextImage, "data-previmage": prevImage
    });
    $img.appendTo('#results');
  }

  var displayLightbox = function(fullUrl) {
    var $img = $('<img>', {
      "src": fullUrl, "class": 'lrg-img', "data-nextimage": nextImage, "data-previmage": prevImage
    });
    $img.appendTo('.overlay');
  }

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

  var generateFullURL = function(photo) {
    return [
      'http://farm',
      photo.farm,
      '.static.flickr.com/',
      photo.server,
      '/',
      photo.id,
      '_',
      photo.secret,
      '.jpg'
    ].join('');
  };

  $('#search').on('submit', function(e) {
    page = 1;
    e.preventDefault();
    $('#results').empty();
    query = $('#query').val();
    searchFlickr(query);
  });

  $('body').on('click', 'img', function () {
    var $link = $(this).attr('data-fullurl');
    $('.overlay').toggle();
    displayLightbox($link);
  });

  $(document).keypress(function (k) {
    if(k.which == 92) {
    $('.lrg-img').attr('src', nextImage);
    console.log(nextImage);
    nextImage = $('.lrg-img').attr('data-nextimage');
    console.log(nextImage);
    }
  });

  $('body').on('click', '.overlay', function () {
    $(this).empty().toggle();
  });


  $(window).on('scroll', function() {

      var pixelsFromBottom = $(document).height() - ($(window).scrollTop() + $(window).height());
      if (pixelsFromBottom < 300) {
        counter += 1;
        if (counter > 1) {
          return
        } else {
          searchFlickr(query);
          page += 1;
          if (page === pages) {
            return;
          }
        }
      };
    });


});
