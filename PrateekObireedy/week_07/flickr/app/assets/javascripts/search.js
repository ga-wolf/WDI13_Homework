
var maxPages;
var maxPage;
var load = false;
var endResults = false;
$(document).ready(function(){

  var current_page = 1;
  var searchFlickr = function (term){
  var flickrURL = 'https://api.flickr.com/services/rest/?jsoncallback=?';
  $.getJSON(flickrURL, {

    method: "flickr.photos.search",
    api_key: "2f5ac274ecfac5a455f38745704ad084",
    text: term,
    format: "json",
    page: current_page++

  }).done(function(data){

    console.log(data);
    maxPage = data.photos.page;
    maxPages = data.photos.pages;
    for(var i = 0; i < data.photos.photo.length; i++){
    var url = generateURL(data.photos.photo[i]);
    displayPhoto(url);
      console.log(url);

    };

    });
  };

var displayPhoto = function(url){
  var $img = $("<img>", {src:url});
  $img.appendTo("#results");
}

var generateURL = function (photo){
  return [

  "http://farm",
  photo.farm,
  ".static.flickr.com/",
  photo.server,
  "/",
  photo.id,
  "_",
  photo.secret,
  "_q.jpg"

  ].join("");

};



$("#search").on("submit", function(e){
  var query = $("#query").val();
  e.preventDefault();


  $("#results").empty();
  current_page = 1;
  searchFlickr(query);

  });

  var showPageNum = function (){
    $('#page').text('Page:'+ current_page);
  };

var loadMorePhotos = function(){
  var pixelsFromBottom = $(document).height()-($(window).scrollTop() +$(window).outerHeight());

  if (pixelsFromBottom < 300 && current_page !== maxPages){

    var query = $("#query").val();
    showPageNum();
    searchFlickr(query);
    console.log("search flickr more here");
  }
};

  $(window).on("scroll", _.throttle(loadMorePhotos, 3000));

});
