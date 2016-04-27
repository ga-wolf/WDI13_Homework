var k;

$(document).ready(function(){

  $('#check-weather').on('submit', function(event){
    event.preventDefault();

    var request_city_country_weather = $('#submit_city_country_weather').val();

    var submit_city_country_weather = 'http://api.openweathermap.org/data/2.5/weather?q=' + request_city_country_weather +
     '&appid=37d779901e66fa574e183edbaffeabe8'

    $.ajax(submit_city_country_weather).done(function(data){
      var $div = data.weather[0].description
      $('#result').html($div);
      k = data;
    });
  });
});
