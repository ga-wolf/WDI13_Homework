$(document).ready( function() {

  $('#search-form').on('submit', function(event){
      event.preventDefault();

      var city = $('#search-input').val();
      var weatherApiKey = '4a768d414e8154b699f8e36f914427dc';
      var weatherURL = 'http://api.openweathermap.org/data/2.5/weather?q=' + city + '&APPID=' + weatherApiKey;

      $.ajax(weatherURL).done(function (data) {
            var currentTemp = data.main.temp - 273.15;
            currentTemp = (Math.round(currentTemp * 100))/100;
            var $tempDisplay = '<p>The current Temperature in '+ data.name + ' is: ' + currentTemp + '&degC </p>';
            $('#weather').html($tempDisplay);
            var map = new google.maps.Map(document.getElementById('map'), {
              center: {
                lat: data.coord.lat,
                lng: data.coord.lon
              },
              zoom: 10
            });
      });
      var search_term = {
        q: city
      };
      var twitterURL = "https://api.twitter.com/1.1/search/tweets.json?" + $.param(search_term);
      $.ajax({
        url: twitterURL,
        dataType: 'jsonp',
        success: function(data) {
          console.log(data);
        }
      });
      var zomatoURL = 'https://developers.zomato.com/api/v2.1/cities?' + $.param(search_term);
      $.ajax({
        url: zomatoURL,
        headers: {
          Accept: 'application/json',
          'user-key': '1c3e1323dc7f20aa5eb5181ece273ce8'
        }
      }).done(function(data) {
        console.log(data);
      });
  });
});
