// Write a program that, given a word and a list of possible anagrams, selects the correct one(s).
//
// In other words, given: "listen" and ["enlists" "google" "inlets" "banana"] the program should return "inlets".



// if [anagram Array] contains a word which contains all of the letters from
// word then log/return that word else retun nada.

//





var Anagram = {


sortAlphabetically :function(word) {
  //SPLITS WORD, ORDERS ALPHABETICALLY AND JOINS IT TOGETHER
  return word.split("").sort(),join("");
}

theEqualizer: function(setWord, getWord); {
//CONVERTS ALL WORDS TO SAME CASE FR TESTING
setword = setword.toLowerCase();
getWord getWord.toLowerCase();

if (setWord !== getWord ) {
  if  this.sortAlphabetically(setWord) === this.sortAlphabetically(getWord)){
    return true;
  }
  return false;
}
return false;
}

areAnagram: function (word, potentialAnagrams) {
  var anagram = [];

  for (var i = 0; i < potentialAnagrams.length; i++) {
    var currentWord = potentialAnagrams[i];
    if (this.theEqualizer(word, currentWord) {
      anagram.push(currentWord);
    }
  }
}

}

}
