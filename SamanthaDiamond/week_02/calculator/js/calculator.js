// For each operation, create an event listener for the button, and when it's clicked,
// find the value of the appropriate input and show the result of the calculation in the
// solution div.
// Bonus: respond to key presses so that the user doesn't have to click the button.

// Calc square of input

var button = document.getElementById("square-button"); // "half-button", "percent-button", "area-button");
var squareInput = document.getElementById("square-input");
var solution = document.getElementById("solution");

var square = function (event) {
    var resultOfSquareInput = "The result of " + squareInput.value + " squared is " + (squareInput.value * squareInput.value);
    solution.innerHTML = resultOfSquareInput;
};

button.addEventListener("click", square);


// calc half on input

var button = document.getElementById("half-button");
var halfInput = document.getElementById("half-input");
var solution = document.getElementById("solution");

var divByTwo = function () {
  var resultOfHalfInput  = "The result of half of " + halfInput.value + " is " + halfInput.value/2;
  solution.innerHTML = resultOfHalfInput;
};

button.addEventListener("click", divByTwo);

// calc fraction

var button = document.getElementById("percent-button");
var percentInput = document.getElementById("percent1-input");
var solution = document.getElementById("solution");

var
