var pageNum = 1;
var loadFinished = false;
var valueName = '';
var maxPages = 0;
var k = [];

$(document).ready(function(){


  var searchFlickr = function(term){
    loadFinished = false;
    var flickerURL = 'https://api.flickr.com/services/rest/?jsoncallback=?';
    $.getJSON(flickerURL, {
      method: 'flickr.photos.search',
      api_key: '2f5ac274ecfac5a455f38745704ad084',
      text: term,
      format: 'json',
      page: pageNum
    }).done(function(data){
      maxPages = data.photos.pages;

      for(var i = 0; i < data.photos.photo.length; i++){
          var url = generateURL(data.photos.photo[i]);
          displayPhoto(url);
      };
      pageNum++;
      setInterval(function(){
        loadFinished = true;
      }, 2000)

      k.push(data);

    });
  };


  var displayPhoto = function (url){
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


    $('#search').on('submit', function (e){
      e.preventDefault();
      var query = $('#query').val()
      if (valueName === query){
        searchFlickr(query);
      } else {
        $('#results').html('');
        searchFlickr(query);
        valueName = query;
      }
    });





    $(window).on('scroll', function(){
        var pixelsFromBottom = $(document).height() - ( $(window).scrollTop() + $(window).height())

        setTimeout(function(){
          if( loadFinished === true && pageNum <= maxPages && pixelsFromBottom < 300 ){
              console.log('new request fired');
              var query = $('#query').val()
              setTimeout(function(){
                searchFlickr(query);
              }, 2000);
            } else if (pageNum >= maxPages){
              $('#notification').show().html('End of search results');
        }
      }, 1000);
    });
});
