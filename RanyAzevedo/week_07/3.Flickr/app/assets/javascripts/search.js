$(document).ready(function(){

var currentPage = 1;
// var searchFlickrBreaker = 0;
var endOfResults = false;
var query;

var searchFlickr = function(term){

  if (endOfResults){
    return;
  }

  var flickrURL = 'https://api.flickr.com/services/rest/?jsoncallback=?';
  $.getJSON(flickrURL, {
    method: 'flickr.photos.search',
    api_key: 'cde076bab7abadf7c0ea47feb709af9e',
    text: term,
    page: currentPage++,
    format: 'json'
  }).done(function(data){
    if (data.photos.page === data.photos.pages){
      endOfResults = true; //reach the last page
    }
    for (var i = 0; i < data.photos.photo.length; i++) {
      // searchFlickrBreaker = 0;
      var url = generateURL(data.photos.photo[i]);
      displayPhoto(url);
    }
  });
};

var debouncedSearchFlickr = _.debounce(searchFlickr, 1000, true);

var displayPhoto = function(url){
  var $img = $('<img>', {src: url});
  $img.appendTo('#results');
};

var generateURL = function(photo){
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

  $('#search').on('submit', function(event){
    event.preventDefault();
    query = $('#query').val();
    currentPage = 1;
    endOfResults = false;
    $('#results').empty();
    searchFlickr(query);
  });

  $(window).on('scroll', function(){
    var pixelsFromBottom = $(document).height() - ($(window).scrollTop() + $(window).height());

    var fetchThreshold = 500;

    if (pixelsFromBottom < fetchThreshold){
      //  searchFlickrBreaker +=1;
      //  if (searchFlickrBreaker > 1) {
      //     return;
      //   } else {
            // var query = $('#query').val;
            debouncedSearchFlickr(query);
            console.log(currentPage);
        }
    });
});
