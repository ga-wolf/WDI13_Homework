// There once was a wise servant who saved the life of a prince. The king promised to pay whatever the servant could dream up. Knowing that the king loved chess, the servant told the king he would like to have grains of wheat. One grain on the first square of a chess board. Two grains on the next. Four on the third, and so on.
//
// There are 64 squares on a chessboard.
//
// Write a program that shows
//
// how many grains were on a particular square;
// how many grains were on each square; and
// the total number of grains on the board.
// Do it in JS (why not use Underscore to take advantage of some of its helpful, Ruby-esque methods?). When you're done, implement a simple HTML UI (feel free to use jQuery).

var board = [];
for (var i = 0; i<64; i++) {
  board.push(Math.pow(2,i));
};

var checkSquare = function(square) {
  return ('There are ' + board[square] + ' grains of wheat on square number ' + square);
};

var totalWheat = function () {
  total = 0;
  for (var i = 0; i < board.length; i++) {
    total += board[i];
  };
  return("The total grains of wheat on the board is " + total);
};

var allSquares = function () {
  for (var i = 0; i < board.length; i++) {
    console.log("Square number " + i + ": " + board[i] + " grains of Wheat.");
  };
};

$(document).ready(function () {

  var clearOutput = function () {
    if ($('.output').length > 0 ) {
      $('.output').remove();
    }
  }

  $('#button').on('click', function () {
    clearOutput();

    var $input = $('#input');

    //if the value is blank or not a number it ignores it
    if ($input.val() === '' || isNaN(Number( $input.val() )) ) {
    } else {
      //otherwise it gets the value of the input and runs the checkSquare function and adds it to the container
      var toCheck = $('#input').val();
      var output = $('<p/>').addClass('output').html(checkSquare(toCheck));
      $('.container').append(output);
    }
    //once it is clicked it will clear the input and autofocus on the input
    $('#input').val('').focus();
  })

  $('#all').on('click', function () {
    clearOutput();

    var output = $('<p/>').addClass('output').html(totalWheat());
    $('.container').append(output);

  //add output of the total of the squares

});






});


allSquares();
console.log('There is a total of ' + totalWheat() + ' grains of wheat');
