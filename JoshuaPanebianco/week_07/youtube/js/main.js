function tplawesome(e,t){res=e;for(var n=0;n<t.length;n++){res=res.replace(/\{\{(.*?)\}\}/g,function(e,r){return t[n][r]})}return res}

$(function () {
   $("form").on("submit", function(e) {
      e.preventDefault();
      // prepare the request for the API
      var request = gapi.client.youtube.search.list({
          part: "snippet",
          type: "video",
          q: encodeURIComponent($("#search").val()).replace(/%20/g, "+"),
          maxResults: 3,
          order: "viewCount",
      });
      // execute request
      request.execute(function(response) {
        var results = response.result;
        $.each(results.items, function(index, item) {
          $.get("item.html", function(data) {
            $("#results").append(tplawesome(data, [{"title":item.snippet.title, "videoid":item.id.videoId}]));
          });

        });
      });
   });
});

function init() {
  gapi.client.setApiKey("AIzaSyBFyikVs3jTPdaKTv6zGQEaqCrsp1mgufg");
  gapi.client.load("youtube", "v3", function () {
    //Youtube API is ready
    isload = true;
    console.log("YOUTUBE LOADED");
  });
}
