$(document).ready(function () {

  var currentPage = 1;

  // function pass word into
  var searchFlickr = function (term) {
    var flickrURL = 'https://api.flickr.com/services/rest/?jsoncallback=?';
    $.getJSON(flickrURL, {
      // params
      method: 'flickr.photos.search',
      api_key: '2f5ac274ecfac5a455f38745704ad084',
      text: term,
      format: 'json',
      page: currentPage,
      per_page: 100
    }).done(function (data) {
      for (var i = 0; i < data.photos.photo.length; i++) {
        var url = generateURL(data.photos.photo[i]);
        displayPhoto(url);
      }
    });
  };

  var displayPhoto = function (url) {
    var $img = $('<img>', {src: url});
    $img.appendTo('#results');
  };

  var generateURL = function (photo) {
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

  // listening for event
  $('#search').on('submit', function (e) {
    e.preventDefault();
    var query = $('#query').val();
    $('#results').empty();
    searchFlickr(query);
  });


  var updateOnScroll = _.debounce(function () {
    console.log("scroll")
    var pixelsFromBottom = $(document).height() - ($(window).scrollTop() + $(window).height())
    if (pixelsFromBottom < 500) {
      // var totalNumPhotos = data.photos.total;
      // var pageNum = data.photos.pages;
      // var imgPerPage = total.photos.perpage;
      // if (pageNum * imgPerPage < totalNumPhotos) {
      //   currentPage += 1;
      //   console.log("images")
      //   var query = $('#query').val();
      //   searchFlickr(query);
      // } else {
      //   currentPage = pageNum;
      // }
      currentPage += 1;
      console.log("images")
      var query = $('#query').val();
      searchFlickr(query);
    };
  }, 1000, true);

  $(window).on('scroll', updateOnScroll);

});


var totalNumPhotos = data.photos.total;
var pageNum = data.photos.pages;
var imgPerPage = total.photos.perpage;
if (pageNum * imgPerPage < totalNumPhotos) {

}
//
