// Create a new Javascript file and link to it with a script tag at the bottom.
// Create a variable to store a reference to the img.
// Change the style of the img to have a "left" of "0px", so that it starts at the
 // left hand of the screens.
// Create a function called catWalk() that moves the cat 10 pixels to the right
// of where it started, by changing the "left" style property.
// Call that function every 50 milliseconds. Your cat should now be moving across
// the screen from left to right. Hurrah!
//
// Bonus #1: When the cat reaches the right-hand of the screen, restart them at
// the left hand side ("0px"). So they should keep walking from left to right
// across the screen, forever and ever. LOOP / When is the end of the screen? /
// figure out how width is th window indow
//
// Bonus #2: When the cat reaches the right-hand of the screen, make them move
// backwards instead. They should keep walking back and forth forever and ever.
// css flip image over
//
// Bonus #3: When the cat reaches the middle of the screen, replace the img
// with an image of a cat dancing, keep it dancing for 10 seconds, and then
// replace the img with the original image and have it continue the walk.
// where is the middle?
// Bonus #4: Pretty much go nuts or whatever.
// var audio = new Audio(...mp3)

//FIRST Catwalking OK

// var img = document.getElementsByTagName('img')[0];
//   img.style.position= 'absolute';
//   img.style.left = '0px';
//
//   var catwalk = function() {
//   var left = parseInt(img.style.left);
//   var right = left + 10;
//   img.style.left = right + 'px';
// };
// window.setInterval(catwalk, 500);


// BONUS #1 cat stops

// var img = document.getElementsByTagName('img')[0];
// img.style.left = '0px';
//
// var windowWidth = window.innerWidth;
//
// var goFoward = function() {
//   var left = parseInt(img.style.left);
//   var right = left + 50;
//   img.style.left = right + 'px';
//     if (left >= windowWidth ){
//       window.clearInterval(goBack);
//   }
// };
// var goBack = window.setInterval(goFoward, 500);


// BONUS #2 - goFoward FLIP goBack

// var img = document.getElementsByTagName('img')[0];
// img.style.left = '0px';
//
// var windowWidth = window.innerWidth;
//
// var goBack = function() {
//   img.style.transform = "scaleX(-1)";
//   var left = parseInt(img.style.left);
//   var right = left - 15;
//   img.style.left = right + 'px';
//   if (left < 0 ){
//     clearInterval(timeID);
//     timeID = setInterval(goFoward, 100);
//   }
// };
//
// var goFoward = function() {
//   img.style.transform = "scaleX(1)";
//   var left = parseInt(img.style.left);
//   var right = left + 15;
//   img.style.left = right + 'px';
//   if (left >= windowWidth ){
//     clearInterval(timeID);
//     timeID = setInterval(goBack, 100);
//   }
// };
// var timeID = setInterval(goFoward, 100);


// BONUS #3 = cat walking + cat dancing

// var img = document.getElementsByTagName('img')[0];
// img.style.left = '0px';
//
// var windowWidth = window.innerWidth;
// var halfWindow = windowWidth / 3;
//
// var goFoward = function() {
//   var left = parseInt(img.style.left);
//   var right = left + 1;
//   img.style.left = right + 'px';
//   if (left >= halfWindow ){
//     window.clearInterval(goBack);
//     document.createElement('img2');
//     img.src = "http://www.heathersanimations.com/cats/catblack.gif";
//     var oldImg = document.getElementsByTagName('img')[0];
//     document.getElementById('imgDIV').replace('img2', 'oldImg');
//   }
// };
//
// var goBack = window.setInterval(goFoward, 50);

// Cat walking + cat dancing + cat walking

var img = document.getElementsByTagName('img')[0];
img.style.left = '0px';

var windowWidth = window.innerWidth;
var halfWindow = windowWidth / 3;

// Cat walking after

var keepWalking = function (){
  var oldImg = document.getElementsByTagName('img')[0];
  oldImg.src = "http://www.anniemation.com/clip_art/images/cat-walk.gif";
  var left = parseInt(img.style.left);
  var right = left + 20;
  img.style.left = right + 'px';
};
setInterval(keepWalking, 500);


// Cat walking foward

var catWalk = function() {
  var left = parseInt(img.style.left);
  var right = left + 10;
  img.style.left = right + 'px';
  if (left >= halfWindow ){
    clearInterval(timeID);
    timeID = setTimeout(keepWalking, 10000);

//Change image to cat dancing

  var newImg = document.getElementsByTagName('img')[0];
  newImg.src = "http://www.heathersanimations.com/cats/catblack.gif";
 }
};

var timeID = setInterval(catWalk, 500);
