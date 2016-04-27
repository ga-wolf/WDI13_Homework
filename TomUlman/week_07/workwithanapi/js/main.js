$(document).ready(function (){


$('#article-lookup').on('submit', function (event) {

event.preventDefault();

var storyTitle = $('#story-title').val();
var storyURL = 'http://content.guardianapis.com/search?q=' + article-name + '&api-key=test';


$.ajax(storyURL).done(function (data) {
  var $title = $('<h2>', {src: data.webTitle});
  $('#result').html($image);
});
});
});
