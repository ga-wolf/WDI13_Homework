// Create a new Javascript file and link to it with a script tag at the bottom.
// For each operation, create an event listener for the button, and when it's clicked, find the value of the appropriate input and show the result of the calculation in the solution div.
// Bonus: respond to key presses so that the user doesn't have to click the button.

var solutionDiv = document.getElementById('solution'); // Store the solution div globally.

var Calculator = {
  square: function(event) {
    if (event.which === 13 || event.type === 'click') { // Check if enter pressed, or calculate button clicked.
      var number = document.getElementById('square-input').value;
      var solution = number * number;
      solutionDiv.innerText = solution;
    }
  },
  half: function(event) {
    if (event.which === 13 || event.type === 'click') { // Check if enter pressed, or calculate button clicked.
      var number = document.getElementById('half-input').value;
      var solution = number / 2;
      solutionDiv.innerText = solution;
    }
  },
  percentage: function(event) {
    if (event.which === 13 || event.type === 'click') { // Check if enter pressed, or calculate button clicked.
      var fraction = document.getElementById('percent1-input').value;
      var whole = document.getElementById('percent2-input').value;
      var solution = (fraction / whole) * 100;
      solutionDiv.innerText = solution + "%";
    }
  },
  circleArea: function(event) {
    if (event.which === 13 || event.type === 'click') { // Check if enter pressed, or calculate button clicked.
      var radius = document.getElementById('area-input').value;
      var solution = Math.PI * (radius * radius);
      solutionDiv.innerText = solution;
    }
  },
  addListeners: function(event) { // Add all event listeners for button press and enter on each field.
    var squareButton = document.getElementById('square-button');
    squareButton.addEventListener('click', this.square);

    var squareInput = document.getElementById('square-input');
    squareInput.addEventListener('keyup', this.square);

    var halfButton = document.getElementById('half-button');
    halfButton.addEventListener('click', this.half);

    var halfInput = document.getElementById('half-input');
    halfInput.addEventListener('keyup', this.half);

    var fractionButton = document.getElementById('percent-button');
    fractionButton.addEventListener('click', this.percentage);

    var fraction2Input = document.getElementById('percent2-input');
    fraction2Input.addEventListener('keyup', this.percentage);

    var areaButton = document.getElementById('area-button');
    areaButton.addEventListener('click', this.circleArea);

    var areaInput = document.getElementById('area-input');
    areaInput.addEventListener('keyup', this.circleArea);
  }
};

// Run the addListeners function to get everything working.
Calculator.addListeners();


function strongEnough(earthquake, age) {
  //your code here
  var buildingStrength = 1000 * Math.exp(-0.01 * age);
  var quakeStrength = earthquake.reduce(function(a, b) {
    return a.concat(b).reduce(function(a, b) {
      return a * b;
    }, []);
  });
  if (buildingStrength > quakeStrength) {
    return 'Safe!';
  } else {
    return 'Needs Reinforcement!';
  }
}
