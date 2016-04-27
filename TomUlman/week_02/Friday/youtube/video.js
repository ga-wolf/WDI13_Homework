// Create an array of every link on the page using document.querySelectorAll(cssSelector)
// Iterate through the array. In each iteration of the loop:
// Find the current href using element.getAttribute(name), and store into a variable
// Generate a thumbnail URL using youtube.generateThumbnailUrl(videoUrl)
// Create an IMG element using document.createElement(tagName)
// Set the "src" of the IMG element using element.setAttribute(name, value)
// Append the IMG to the link using element.appendChild(element)
// Quick Tip: If you need a refresher on the DOM API, check out slides 1-12 from the DOM Review class here.

//
//
// var links = document.querySelectorAll('a');
//
// for (var i = 0; i < links.length; i++ ) {
// var link = links[i];
// var linkUrl = link.getAttribute('href');
// var thumbnailUrl = youtube.generateThumbnailUrl( linkUrl );
// var thumbnailImage = document.createElement("img");
// thumbnailImage.setAttribute("src", thumbnailUrl);
//
// document.body.appendChild(thumbnailImage);
// link.appendChild(thumbnailImage);
// }

var $links = $('a');

for (var i = 0; i < $links.length; i++) {
var $link = $links.eq(i);
var linkUrl = $link.attr('href');
var thumbnailUrl = youtube.generateThumbnailUrl(linkUrl);
var $thumbnailImage = $('<img>').attr("src", thumbnailUrl);
$link.append ($thumbnailImage);

}
