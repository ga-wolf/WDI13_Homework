$(document).ready(function () {
  $("#weather-search").on('submit', function (event) {

    event.preventDefault();

    var city = $("#city").val();
    var cityURL = "http://api.openweathermap.org/data/2.5/weather?q=" + city + "&appid=3d91048c085ba00ce5ec180811ee6e74";

    $.ajax(cityURL).done(function (data) {
      var $weather = $('<h2>').text(data.weather[0].description);
      $('#weather-city').html($weather);
    }).done(function (data) {
      var $temp = $('<p>').text(data.main.temp);
      $('#temp').html($temp);
    }).done(function (data) {
      var $windSpeed = $('<p>').text(data.wind.speed);
      $('#wind-speed').html($windSpeed);
    });
  });
});
