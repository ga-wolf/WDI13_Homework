var img = document.getElementsByTagName('img')[0];
img.style.position = 'absolute';
img.style.left = '0px';

var walkingCat = function() {
  var oldLeft = parseInt(img.style.left);
  var newLeft = oldLeft + 5;
  img.style.left = newLeft + 'px';
  if (parseInt(img.style.left) > window.innerWidth) {
      img.style.left = '0px';
  }
};

window.setInterval(walkingCat, 100);

var colorCat = document.getElementById('nyan');
colorCat.style.position = 'absolute';
colorCat.style.right = '0px';

var nyanCat = function() {
  var oldRight = parseInt(colorCat.style.right);
  var newRight = oldRight + 1;
  colorCat.style.right = newRight + 'px';
  if (parseInt(colorCat.style.right) > window.innerWidth) {
    colorCat.style.right = '0px';
  }
};

window.setInterval(nyanCat, 5);

var tCat = document.getElementById('toast');
tCat.style.top = '0px';

var toastCat = function() {
  var oldTop = parseInt(tCat.style.top);
  var newTop = oldTop + 1;
  tCat.style.top = newTop + 'px';
  if (parseInt(tCat.style.top) > window.innerHeight) {
    tCat.style.top = '0px';
  }
};
  window.setInterval(toastCat, 5);
