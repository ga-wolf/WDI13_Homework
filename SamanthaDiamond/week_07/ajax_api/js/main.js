$(document).ready(function () {

  $('#weather_data').on('submit', function (event) {
    event.preventDefault();

    $('#flash').empty();

    var cityName = $('#city_id').val();
    var weatherURL = "http://api.openweathermap.org/data/2.5/weather?q=" + cityName + "&APPID=b5f32e0eae893098ab0161f62864573e";

    $.getJSON(weatherURL)
    .done(function(data) {
      try {
        $('#weather_forcast').text("Weather forcast: " + data.weather[0].description);
        $('#temperature').text("Temperature: " + data.main.temp);
        $('#humidity').text("Humidity: " + data.main.humidity);
        $('#wind_speed').text("Wind Speed: " + data.wind.speed);
      } catch (e) {
        $('#flash').html('<div id="error">Unable to access weather for your chosen city</div>');

      };
    })
    .fail(function() {
      $('#alert').text("server error");
    })
  });
});
