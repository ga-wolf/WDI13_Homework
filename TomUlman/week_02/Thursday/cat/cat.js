// Create a variable to store a reference to the img.
// Change the style of the img to have a "left" of "0px", so that it starts at the left hand of the screens.
// Create a function called catWalk() that moves the cat 10 pixels to the right of where it started, by changing the "left" style property.
// Call that function every 50 milliseconds. Your cat should now be moving across the screen from left to right. Hurrah!
//
// Bonus #1: When the cat reaches the right-hand of the screen, restart them at the left hand side ("0px"). So they should keep walking from left to right across the screen, forever and ever.
//
// Bonus #2: When the cat reaches the right-hand of the screen, make them move backwards instead. They should keep walking back and forth forever and ever.
//
// Bonus #3: When the cat reaches the middle of the screen, replace the img with an image of a cat dancing, keep it dancing for 10 seconds, and then replace the img with the original image and have it continue the walk.
//
// Bonus #4: Pretty much go nuts or whatever.

// STILL WORKING ON BELOW
//
// var img = document.getElementsByTagName("img")[0];
// var delta = 1;
// img.style.left = 0;
//
// var catWalkLeft = function() {
// var catStart = parseInt(img.style.left);
// var catWalk = catStart + (5 * delta);
// var walkies = img.style.left = catWalk + "px";
//
// if (parseInt(img.style.left) <= 0 || (parseInt(img.style.left) >= window.innerWidth)) {
// delta = delta * -1;
// }
//
// if (delta === -1) {
// img.style.transform = 'scaleX(-1)';
// } else if  (delta === 1) {
//   img.style.transform = 'scaleX(1)';
// }
//
// if (parseInt(img.style.left) === (window.innerWidth / 2)) {
//   window.clearInterval(startCat);
//   img.src = "http://www.officialpsds.com/images/thumbs/HALLOWEEN-SCARY-CAT-01-psd70053.png";
// window.setTimeout(catWalkLeft, 100 );
// }
// };
//
//
// var startCat = setInterval(catWalkLeft, 10);





//
// ========================= THE FUN VERSION ==================================
// ======== === CAUTION DO NOT RUN IF YOU SUFFE FROM EPILEPSY =================
var img = document.getElementsByTagName("img")[0];
var delta = 1;
img.style.left = 0;

var catWalkLeft = function() {
var catStart = parseInt(img.style.left);
var catWalk = catStart + (5 * delta);
var walkies = img.style.left = catWalk + "px";

if (parseInt(img.style.left) <= 0 || (parseInt(img.style.left) >= window.innerWidth)) {
delta = delta * -1;
}

if (delta === -1) {
img.style.transform = 'scaleX(-1)';
} else if  (delta === 1) {
  img.style.transform = 'scaleX(1)';
}

if (parseInt(img.style.left) === (window.innerWidth / 2)) {
  window.clearInterval(startCat);
  img.src = "http://www.officialpsds.com/images/thumbs/HALLOWEEN-SCARY-CAT-01-psd70053.png";
window.setTimeout(setInterval(catWalkLeft, 10), 100 );
}
};


var startCat = setInterval(catWalkLeft, 10);
// ============================================================================
