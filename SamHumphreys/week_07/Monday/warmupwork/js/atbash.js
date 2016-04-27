// Atbash Cipher
// The Atbash cipher is a simple substitution cipher that relies on transposing all the letters in the alphabet such that the resulting alphabet is backwards. The first letter is replaced with the last letter, the second with the second-last, and so on.
//
// An Atbash cipher for the Latin alphabet would be as follows:
//
// Plain:  abcdefghijklmnopqrstuvwxyz
// Cipher: zyxwvutsrqponmlkjihgfedcba
// It is a very weak cipher because it only has one possible key, and it is a simple monoalphabetic substitution cipher. However, this may not have been an issue in the cipher's time.
//
// Examples
//
// Encoding "test" gives "gvhg"
// Decoding "gvhg" gives "test"

var inputs = {
  plain: "abcdefghijklmnopqrstuvwxyz",
  cypher: "zyxwvutsrqponmlkjihgfedcba",
};

var doStuff = {
  encypher: function(word) {
    codeword = [];
    for (var i = 0; i < word.length; i++) {
      var letter = word[i].toLowerCase();
      var place = inputs.plain.indexOf(letter);
      codeword.push(inputs.cypher[place]);
    };
    return codeword.join('');
  },
};

$(document).ready(function() {
  $('.doit').on('click', function() {
    var word = $('.input').val();
    answer = doStuff.encypher(word);
    $('.container').append('<p>' + answer + '</p>');
  })
});
