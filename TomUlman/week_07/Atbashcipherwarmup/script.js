
/////////////////////////////////// The finished badger version ////////////////////////////


// Global variables


var letters = "abcdefghijklmnopqrstuvwxyz";
var reverseLetters = letters.split("").reverse().join("");

console.log(letters);
console.log(reverseLetters);



// Encode the string

var encode = function(str) {
  str = str.toLowerCase();
  var encodedText = "";
  for (var i = 0; i < str.length; i++) {
    var index = letters.indexOf(str[i]);
    var reverseChar = reverseLetters.charAt(index);
    encodedText += reverseChar;
  }
  return encodedText;
};

// Decode the string

var decode = function(str) {
  str = str.toLowerCase();
  var decodedText = "";
  for (var i = 0; i < str.length; i++) {
    var index = reverseLetters.indexOf(str[i]);
    var forwardChar = letters.charAt(index);
    decodedText += forwardChar;
  }
  return decodedText;
};








///////////////////////////////////////////////////////////////////////////////////////////









// // Plain:  abcdefghijklmnopqrstuvwxyz
// // Cipher: zyxwvutsrqponmlkjihgfedcba
//
//
// var coder = {
// plain: ["a", "b", "c", "d", "e", "f", "g", "h", "i",
//              "j", "k", "l", "m", "n", "o", "p", "q", "r",
//              "s", "t", "u", "v", "w", "x", "y", "z"],
//
// cipher: plain.reverse(),
//
//
//
// encoder: function(string) {
//   var coder = "";
//   string = string.toLowerCase();
//   for (i = 0, i < string.length, i++) {
//   var key = this.plain.indexOf(string[i])
//   coder = this.cipher.indexOf(key)
//   // iterate through string
//   // match string letter to plain index
//   // take the plain indexes and covert to cipher indexes
//   }
//
// },
//
//
// decoder: function() {
//
// }
//
// }
