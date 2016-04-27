// // AIzaSyDGTOhQUHhLvdQMY8DhGz3KF4Nny9kh5qM ----- API KEY
//


$(function(){

$("form").on("submit", function(e){
  e.preventDefault();
  var request = gapi.client.youtube.search.list({
    part: "snippet",
    type: "video",
    q: encodeURIComponent($("#search").val()).replace(/%20/g, "+"),
    maxResults: 3,
    order: "viewCount",
    });
    request.execute(function(response){
      console.log(response);
    });
  });
});

function init(){

  gapi.client.setApikey("AIzaSyDGTOhQUHhLvdQMY8DhGz3KF4Nny9kh5qM");
  gapi.client.load("youtube", "v3",function(){

  });
}
