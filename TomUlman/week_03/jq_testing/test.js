// Either start with your code from the jQuery workshop, or download the starter file.

// In the body of your HTML, create a <div> to hold the video player, either below or to the side of the list, and give it an id.

// In the script tag that you were working in before, create a thumbnailify() function that takes a single argument.

$('h1').funText(33, 'candy');

// var thumbnailify = function(videoLink) {
//   var linkUrl = $videoLink.attr('href');
//   var thumbnailUrl = youtube.generateThumbnailUrl(linkUrl);
//   var thumbnailImg = $('<img>');
//   thumbnailImg.attr('src', thumbnailUrl);
//   $videoLink.append(thumbnailImg);
//
//   $videoLink.on("click", function (event) {
//     event.prevetDefault();
//     var videoEmbed = $("<iframe>");
//     videoEmbed.attr("src" youtube.generateEmbedUrl(linkUrl) );
//     console.log('linked');
//   });
// };
//
//   var $videoLinks = $('a');
//   for (var i = 0; i < $videoLinks.length; i++) {
//   var $videoLink = $($videoLinks.eq(i);
//   thumbnailify($videoLink);
//
// }
// Move the code that is currently inside your for loop into that thumbnailify() function.

// Change the contents of your function so that it uses a single argument, which is a jQuery object that represents an <a>, rather than an array of elements.

// Move the for loop so that it occurs after you define thumbnailify()

// Call thumbnailify() from inside your for loop.

// Make sure your player first works like it did before. Hint: you should only reference an array index from inside of the for loop.

// Now, in the thumbnailify() function, add a click listener to the link. We recommend using an anonymous function for the callback (not a named function). Put a console.log inside the callback to make sure it works.

// In the click listener callback, you will be using the "create and store, manipulate, inject" pattern to display an embedded video in the DIV you created.

// To find out what the code for an embedded Youtube video looks like, go to Youtube.com and find any embed code for a video.

// You can use youtube.generateEmbedUrl() from the youtube.js library to generate an embed URL.

// Use string concatenation, .html(), or other jQuery method of your choice to assemble and insert the embedded video element.

// Check your work! Try all your video links. Is there anything you need to change?
// As a bonus, try to make the video watcher <div> fade in using jQuery.
// Make sure that you use your browser developer tools to make debugging easier while working on this. Check for errors, and use console.log() to figure out how far your code makes it, and what the values of your variables are along the way.


var youtube = {

    /**
     * Expects an argument that is either a youtube URL or a ID,
     * and returns back the ID.
     */
    getIdFromUrl: function(videoIdOrUrl) {
        if (videoIdOrUrl.indexOf('http') === 0) {
            return videoIdOrUrl.split('v=')[1];
        } else {
            return videoIdOrUrl;
        }
    },

    /**
     * Expects an argument that is either a youtube URL or a ID,
     * and returns back the URL of the thumbnail for that video.
     */
    generateThumbnailUrl: function(videoIdOrUrl) {
        return 'http://i3.ytimg.com/vi/' + youtube.getIdFromUrl(videoIdOrUrl) + '/default.jpg';
    },

    /**
     * Expects an argument that is either a youtube URL or a ID,
     * and returns back the URL for that video.
     */
    generateWatchUrl: function(videoIdOrUrl) {
        return 'https://www.youtube.com/watch?v=' + youtube.getIdFromUrl(videoIdOrUrl);
    },

    /**
     * Expects an argument that is either a youtube URL or a ID,
     * and returns back the embed URL for that video.
     */
    generateEmbedUrl: function(videoIdOrUrl) {
        return 'http://www.youtube.com/embed/' + youtube.getIdFromUrl(videoIdOrUrl);
    }

};
