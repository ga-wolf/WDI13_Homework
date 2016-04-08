$(document).ready(function () {

  $('#article-lookup').on('submit', function (event) {
    event.preventDefault();
    $('#result').text('');
    var topic = $('#search-topic').val();
    var fromDate = $('#from-date').val();

    var guardianURL = "http://content.guardianapis.com/search?from-date=" + fromDate + "&q=" + topic + "&api-key=e71e9e22-9168-4e7e-a223-875137fd0575";

    $.ajax(guardianURL).done(function (data) {
      var returnArray = data.response.results;
      for (var i = 0; i < returnArray.length; i++) {
        var title = returnArray[i]["webTitle"];
        var $p = $('<p>').text(title);
        $('#result').hide();
        var $aTag = $("<a>").attr("href", returnArray[i]["webUrl"]).attr("target", "_blank").html($p);
        $aTag.appendTo('#result');
        $('.topic').text(topic);
        $('#result').slideDown('slow');
      };
    });
  });
});
