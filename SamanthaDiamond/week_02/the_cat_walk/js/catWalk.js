// Create a new Javascript file and link to it with a script tag at
// the bottom.
// Create a variable to store a reference to the img.
// Change the style of the img to have a "left" of "0px", so that
// it starts at the left hand of the screens.
// Create a function called catWalk() that moves the cat 10 pixels
// to the right of where it started, by changing the "left" style
// property.
// Call that function every 50 milliseconds. Your cat should now be
// moving across the screen from left to right. Hurrah!
//
// Bonus #1: When the cat reaches the right-hand of the screen, restart them at
// the left hand side ("0px"). So they should keep walking from left to right
// across the screen, forever and ever.
//
// Bonus #2: When the cat reaches the right-hand of the screen, make them move
// backwards instead. They should keep walking back and forth forever and ever.
//
// Bonus #3: When the cat reaches the middle of the screen, replace the img
// with an image of a cat dancing, keep it dancing for 10 seconds, and then
// replace the img with the original image and have it continue the walk.
//
// Bonus #4: Pretty much go nuts or whatever.


// catWalk Basic

// var img = document.getElementsByTagName("img")[0];
// img.style.left = "0px";
// img.style.position = "absolute";
//
// var catWalk = function () {
//   var pos = parseInt(img.style.left) + 1;
//   img.style.left = pos + "px";
// };
//
// setInterval(catWalk, 50);
//
// // Bonus #1
//
// var img = document.getElementsByTagName('img')[0];
// img.style.position = "absolute";
// img.style.left = '-200px';
// var catWalk = function () {
//   var currentPos = parseInt(img.style.left);
//   img.style.left = (currentPos + 5) + 'px';
//   if (currentPos > window.innerWidth) {
//     img.style.left = '-200px';
//   }
// }
// setInterval(catWalk, 50);

// Bonus #2

var img = document.getElementsByTagName('img')[0];

// variables
var leftBorder = 0;
var rightBorder = window.innerWidth;
var catWidth = 200;
var delta = 5;

img.style.position = "absolute";
img.style.left = String(-catWidth)+'px';

var catWalk = function () {
  var position = parseInt(img.style.left);
  img.style.left = String(position + delta) + 'px';
  if (position > rightBorder) {
    delta = -5;
  }
  if (position < leftBorder-catWidth){
    delta = 5;
  }
}

setInterval(catWalk, 10);

// Bonus #3
