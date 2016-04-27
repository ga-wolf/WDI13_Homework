var catImage = document.getElementsByTagName('img')[0];
var ratImage = document.getElementsByTagName('img')[1];

var input = document.getElementById('input');
var width = window.innerWidth;
var ascii = 0;
var body = document.getElementsByTagName('body')[0];
var scores = document.getElementsByTagName('span');
var container = document.getElementsByClassName('container')[0];

var lettersTyped = 0;
var correct = 0;
var mistakes = 0;

body.style.backgroundColor = '#A4A4A4';
input.style.backgroundColor = '#A4A4A4';
input.style.border = 0;
container.style.margin = '200px 400px';
catImage.style.left = 0;
ratImage.style.left = '200px';
ratImage.style.top = '60px';

window.onload = function() {
  randomLetter();
};

var randomLetter = function() {
  var random = Math.random() * 25;
  random = parseInt(random.toFixed());
  ascii = random + 97;
  var letter = String.fromCharCode(ascii);
  document.getElementById('key-to-type').innerHTML = "Press: ' " + letter +" '";
};

var movecat = function() {
  var oldleft = parseInt(catImage.style.left);
  var newleft = oldleft + 1;
  catImage.style.left = newleft + 'px';
  if (parseInt(ratImage.style.left) === (parseInt(catImage.style.left) + 60)) {
    gameOver();
  }
};
var intervalCat = setInterval(movecat, 60);

var moverat = function() {
  var oldleft = parseInt(ratImage.style.left);
  var newleft = oldleft + 15;
  ratImage.style.left = newleft + 'px';
  if (newleft >= width) {
    gameWon();
  }
};

var keylogger = function(event) {
  if (event.which === ascii) {
    //play(audio/gun.mp3);
    moverat();
    scoreUpdate('correct');
    randomLetter();
  } else {
    //play(gun.mp3);
    scoreUpdate('wrong');
  }
};

var gameOver = function() {
  document.getElementById('key-to-type').innerHTML ="Game Over";
  clearInterval(intervalCat);
  //reverseRat();
  intervalPickupRat = setInterval(pickupRat, 100); // made intervalPickupRat global
  setTimeout(reverseCat, 800);
  //setTimeout(function() {
    //setInterval(returnCat, 60)}, 900);
    setTimeout(function(){setInterval(returnCat, 60)},900);
};
var scoreUpdate = function(update) {
  lettersTyped++;
  if (update === 'correct'){correct++;} else {mistakes++;}
  scores[0].innerHTML = (correct / lettersTyped * 100).toFixed(0);
  scores[1].innerHTML = lettersTyped;
  //scores[2].innerHTML = correct;
  //scores[3].innerHTML = mistakes;

}

input.addEventListener('keypress', keylogger);

var pickupRat = function() {
  var oldtop = parseInt(ratImage.style.top);
  console.log(oldtop);
  var newtop = oldtop - 3;
  ratImage.style.top = newtop + 'px';
  if (newtop === 30) {
    ratImage.style.visibility = 'hidden';
    clearInterval(intervalPickupRat);
  }
};

var returnCat = function() {
  var oldleft = parseInt(catImage.style.left);
  var newleft = oldleft - 3;
  catImage.style.left = newleft + 'px';
};

var reverseCat = function() {
  catImage.style.webkitTransform = 'scaleX(-1)';
};

var reverseRat = function() {
  ratImage.style.webkitTransform = 'scaleX(-1)';
};

var gameWon = function() {
  document.getElementById('key-to-type').innerHTML ="YOU WON!!!";
  alert("You Won!!");
};

//font

WebFontConfig = {
  google: { families: [ 'Oswald::latin' ] }
};
(function() {
  var wf = document.createElement('script');
  wf.src = 'https://ajax.googleapis.com/ajax/libs/webfont/1/webfont.js';
  wf.type = 'text/javascript';
  wf.async = 'true';
  var s = document.getElementsByTagName('script')[0];
  s.parentNode.insertBefore(wf, s);
 })();
  body.style.fontFamily = 'Oswald';
