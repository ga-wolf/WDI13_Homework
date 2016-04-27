var img = document.getElementsByTagName('img')[0];
var img1=document.getElementsByTagName('img')[1];
var img2=document.getElementsByTagName('img')[2]
var animate;
var half= window.innerWidth/2;
img2.style.position='absolute';
img2.style.bottom=
img1.style.position="absolute";
img1.style.right="0px";
img.style.position = 'absolute';
img.style.left = '0px';

var kittykat = function() {
  var oldTop = parseInt(img.style.left);
  var newTop = oldTop + 1;
  img.style.left = newTop + 'px';
  if (parseInt(img.style.left) < innerWit )
}

var gold = function(){
  var oldTop=parseInt(img1.style.right);
  var newTop=oldTop+1;
  img1.style.right= newTop + "px";
}

var turtle = function(){
  var oldTop = parseInt(img2.style.left);
  var newTop = oldTop + 1;
  img2.style.left = newTop + 'px';
};

window.setInterval(kittykat, 10);
window.setInterval(gold, 10);
window.setInterval(turtle, 10);
