var img = document.getElementsByTagName('img')[0];
img.style.top = '570px';
img.style.left = '970px';
img.style.width = '50px';
var height = window.innerHeight;

var catWalk = function() {

  var oldTop = parseInt(img.style.top);
  var newTop = oldTop + 1;
  img.style.top = newTop + 'px';
  var oldLeft = parseInt(img.style.left);
  var newLeft = oldLeft - 20;
  img.style.left = newLeft + 'px';
  var oldWidth = parseInt(img.style.width);
  var newWidth = oldWidth + 6;
  img.style.width = newWidth + 'px';

console.log(newTop,height);
  if ((newTop + newWidth) >= height) {
    console.log('x');
  clearInterval(timerID);
  }
};

var timerID = setInterval(catWalk, 190);
