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

//// after Marcs advice ////

var grains = [];
var chessBoard = _.range(0, 65);

grains[0] = 1;
for (i = 1; i < chessBoard.length; i++) {
  grains[i] = Math.pow(2, chessBoard[i]);
  var total =
  console.log("chessBoard square " + chessBoard[i] + " has " + grains[i-1] + " grains on it.");

}
/// Finding the total
var total = grains.reduce(add, 0);

function add(a, b) {
    return a + b;
}

console.log("The chessBoard has " + total + " grains in total." );

////// Original solution ////////
// var grains = [];
// var chessBoard = _.range(1,65);
//
// for (i = 0; i < chessBoard.length-1; i++) {
//   grains[i] = Math.pow(2, chessBoard[i]);
// }
// grains.unshift(1);
// console.log(chessBoard);
// console.log(grains)


// Badger solution
//
// var Grains = {
//
//   range: _.range(1, 65)
//   square: function(n) {
//       return Math.pow(2, n-2);
//   },
//
//   total: function(){
//
//   },
//
// all: function() {
//
//
// }
//
// };
