var k;

$(document).ready(function(){
  $("#buttonn").on("click", function(){
    var cityName = $("#text-search").val();
    var weatherURL = "http://api.openweathermap.org/data/2.5/weather?q="+ cityName +"&APPID=e03cb30f43c67dee3c1289e7944b40e1";
    $.ajax(weatherURL,{
      success: function (data){
         console.log(data);
         k = data
        var $h2 = ("<h2>" + "The weather today: " + data.weather[0].description);
        var $h3 = ("<h3>" + "The temperature today: " + (data.main.temp - 273))
        $("#result").html($h2);
        $("#result1").html($h3);
      }
    })
  })
})

// e03cb30f43c67dee3c1289e7944b40e1 ------ API KEY
