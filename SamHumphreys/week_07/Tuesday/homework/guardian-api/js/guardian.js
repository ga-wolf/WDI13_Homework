// api key = eb118c92-f424-4bc2-9384-d29b786cf077

var self;

$(document).ready(function() {

  $('#news-search').on('submit', function(event) {
    event.preventDefault();
    createResults();

    var searchSubject = $('#search-subject').val();
    var searchURL = 'http://content.guardianapis.com/search?q=' + searchSubject + '&api-key=test';

    $.ajax(searchURL).done( function(data) {
      var dataBack = data.response.results;
      for (var i = 0; i < dataBack.length; i++) {
        thisItem = dataBack[i];
        var $thisList = $('<li>').attr({'data': thisItem.webUrl, 'class': i}).html(thisItem.webTitle);

        $thisList.on('click', function () {
          self = $(this);
          console.log(self.attr('data'));
        });
        $('#results').append($thisList)
      };
    });
  });
});

var clearResults = function() {
  if ($('#results')) {
    $('#results').remove();
  };
};

var createResults = function() {
  clearResults();
  var $results = $('<ul>').attr('id', 'results');
  $('body').append($results);
}
