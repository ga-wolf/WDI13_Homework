

var spawnCat = function() {
  var cat = {
    direction: 1,
    domObject: document.createElement("img"),
    intervalID: "",
    scale: Math.random(),
    flipped: false, // Randomise the scale of the generated cat.
    clicks: 0,
    walkLogic: function() {
      // domObject = document.getElementById(newcat.catID);
      // console.log(domObject);
      var oldPos = parseInt(cat.domObject.style.left);
      var newPos = oldPos + (8 * cat.direction);
      cat.domObject.style.left = newPos + "px";
      if (parseInt(cat.domObject.style.left) >= window.innerWidth || parseInt(cat.domObject.style.left) < -200) {
        cat.direction = - cat.direction;
        cat.flipImage();
      }
    },
    startWalk: function() {
      cat.domObject.src = "http://www.anniemation.com/clip_art/images/cat-walk.gif";
      cat.intervalID = window.setInterval(cat.walkLogic, 50);
    },
    setUpCat: function() {
      cat.domObject.style.position = 'absolute';
      cat.domObject.style.left = '-200px';
      cat.domObject.style.top = (67 + (13 * cat.scale)) + "%";
      cat.domObject.style.cursor = 'pointer';
      cat.domObject.className = 'cat';
      cat.domObject.style.width = Math.round(cat.scale * 300) + "px";
      cat.domObject.style.zIndex = Math.round(1000 * cat.scale);
      cat.domObject = document.body.appendChild(cat.domObject);
      cat.addClickListener();
      cat.startWalk();
    },
    makeDanceOrExplode: function() {
      window.clearInterval(cat.intervalID);
      cat.clicks += 1;
      if (cat.clicks < 5) {
        cat.domObject.src = "http://www.dogbloom.com/uploads/2/6/3/6/26365194/1737_orig.gif";
        window.setTimeout(cat.startWalk, 5000);
        startDisco();
      } else {
        cat.domObject.src = "http://rs523.pbsrc.com/albums/w356/unkadug/explosion-1.gif~c200";
        window.setTimeout(cat.destroyCat, 800);
        var audio = new Audio('audio/explosion.mp3');
        audio.play();
      }
    },
    destroyCat: function() {
      cat.domObject.style.display = 'none';
    },
    addClickListener: function() {
      cat.domObject.addEventListener('click', cat.makeDanceOrExplode);
    },
    flipImage: function() {
      if (cat.flipped === true) {
        cat.domObject.style.filter = '';
        cat.domObject.style.transform = '';
        cat.flipped = false;
      } else if (cat.flipped === false) {
        cat.domObject.style.filter = 'FlipH';
        cat.domObject.style.transform = 'scaleX(-1)';
        cat.flipped = true;
      }
    }
  };
  cat.setUpCat();
  return cat;
};

// Clean this code up into disco object...

var disco = document.getElementsByClassName('discoOverlay')[0];
var colors = ['pink', 'orange', 'red', 'white', 'blue', 'yellow', 'red', 'purple', 'white', 'green'];
var currentColorIndex = 0;
var isDisco = false;
var september = new Audio('audio/september.mp3');
var flutes = new Audio('audio/flutes.mp3');
flutes.play();
var discoTimeout;


var discoIterate = function() {
  if (currentColorIndex < (colors.length - 1)) {
    disco.style.backgroundColor = colors[currentColorIndex];
    currentColorIndex += 1;
  } else {
    currentColorIndex = 0;
    disco.style.backgroundColor = colors[currentColorIndex];
    currentColorIndex += 1;
  }
};

var startDisco = function () {
  if (isDisco) {
    window.clearTimeout(discoTimeout);
    discoTimeout = window.setTimeout(stopDisco, 5000);
    console.log(discoTimeout);
  } else {
    flutes.pause();
    disco.style.display = 'block';
    september.play();
    discoTimeout = window.setTimeout(stopDisco, 5000);
    isDisco = true;
  }
};

var stopDisco = function () {
  disco.style.display = 'none';
  september.pause();
  isDisco = false;
  flutes.play();
};

window.setInterval(discoIterate, 350);



button = document.getElementsByClassName('spawnCat')[0];
button.addEventListener('click', spawnCat);
