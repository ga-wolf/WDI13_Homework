// MAP
var map;
function initMap() {
  map = new google.maps.Map(document.getElementById('map'), {
    center: {lat: 35.6895, lng: 139.69},
    zoom: 12
  });
}



$(document).ready(function() {
  $('.display-guardian__toggle').on('click', function() {
    $(this).toggleClass('fa-arrow-down');
    displayGuardian.toggle();
  });

  /////////////////
  //  STATICS
  /////////////////

  // Guardian
  var displayGuardian = $('.display-guardian__results');

  // IPinfo
  var displayIP = $('.display-ip__results--ip');
  var displayCity = $('.display-ip__results--city');
  var lat;
  var lng;

  // Weather
  var w1 = 'http://api.openweathermap.org/data/2.5/weather?';
  var w4 = '&appid=f041e00af5e7180f62716eaada96e00e';

  var displayDescription = $('.display-weather__description');
  var displayTemp = $('.display-weather__temp');
  var displayHumidity = $('.display-weather__humidity');




  /////////////////
  //  DYNAMICS
  /////////////////

  // IP Info AJAX
  var ipURL = 'http://ipinfo.io/';
  $.ajax({
    url: ipURL,
    dataType: 'json'
  })
    .done(function(data) {
      console.log(data);
      var ip = data.ip;
      var city = data.city;
      lat = data.loc.slice(0, data.loc.indexOf(','));
      lng = data.loc.slice(data.loc.indexOf(',')+1);

      console.log(lat, lng);

      displayIP.empty().append(ip);
      displayCity.empty().append(city);

      // re-center map
      var center = new google.maps.LatLng(lat,lng);
      map.setCenter(center);



  })
  .done(function(){

    // OpenWeather AJAX
    var w2 = 'lat=' + lat;
    var w3 = '&lon=' + lng;
    var weatherURL = w1 + w2 + w3 + w4;
    console.log(weatherURL);

    $.ajax({
      url: weatherURL
    })
    .done(function(data){
      var description = data.weather[0].main + ', ' + data.weather[0].description;
      console.log(data);
      var humidity = data.main.humidity + '%';
      var temp = (data.main.temp - 273.15).toFixed(1) + '°C';

      displayDescription.text(description);
      displayHumidity.text(humidity);
      displayTemp.text(temp);

    });
  });






  // Guardian AJAX
  $('#search-form').on('submit', function(event) {
    event.preventDefault();
    console.log('form submitted');

    var searchTerm = $('#search-input').val();
    var guardianURL = 'http://content.guardianapis.com/search?q=' + searchTerm + '&api-key=test';
    var $div = $('<div>', {
      class: 'display-guardian__div'
    });
    var $p = $('<p>', { class: 'display-guardian__title' , text: 'Loading ... '});
    console.log($p);
    displayGuardian.append($div.append($p));



    $.ajax(guardianURL)
      .done(function(data) {
        console.log(data);
        displayGuardian.empty();
        var results = data.response.results;
        results.forEach(function(el) {
          var title = el.webTitle;
          var date = el.webPublicationDate;
          var url = el.webUrl;

          var $div = $('<div>', {
            class: 'display-guardian__div'
          });
          var $a = $('<a>', {
            href: url,
            target: '_blank',
            class: 'display-guardian__link'
          });
          var $p1 = $('<p>', {
            text: title,
            class: 'display-guardian__title'
          });
          var $p2 = $('<p>', {
            text: date,
            class: 'display-guardian__date'
          });
          $a.append($p1).append($p2);
          displayGuardian.append($div.append($a));
        });
      });
  });

  $('#search-form').trigger('submit');

});
