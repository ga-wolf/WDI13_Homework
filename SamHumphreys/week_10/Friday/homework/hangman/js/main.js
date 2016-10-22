// The Hangman Game:
//
// The game selects a random word from a word list and makes that the secret word
// The player guesses one letter at a time, trying to figure out what the word is
// If the player guesses correctly, any instances of that letter are revealed in the secret word
// If the player guesses incorrectly, they are penalized by taking away a guess
// If a player reveals all of the letters of the secret word, they win
// If a player makes 8 incorrect guesses before solving the secret word, they lose
// To do:
//
// Plan out your object model. What variables and functions will each object have? How will the different objects communicate with each other?
// Get the logic to work and make sure you have the game working in the console first before translating it over to update the DOM.
// Translate your game over so it updates the DOM.
// Once you get the game working:
// Implement a "reset" button that will reset the game and choose a new word
// Implement a "give up" button that will show the solution
// Are there ways to refactor your code to make it DRYer?
// Bonus:
//
// Validate the input so that only single letters are accepted as guesses
// Change the input format so that there is no text field. You can get input by "listening" to the keyup event and figuring out which key was pressed.
// Draw the hanged man guy using CSS
// Animate the actual moment of execution with frighteningly gruesome detail
// Implement a "hint" button that will reveal one of the letters in the word
// Provide a backend to keep track of scores, and an admin to manage the list of possible words.

var words = {
  // wordList: ['hello'],
  wordList: ['two','three','four'],
  wordInPlay: '',
  correctGuesses: [],
  incorrectGuesses: [],
  incorrectBeforeLosing: 10
};

var setup = {
  reset: function () {
    words.correctGuesses = [];
    words.incorrectGuesses = [];
    setup.pickWord(words.wordList);
  },
  pickWord: function (wordsArray) {
    words.wordInPlay = _.sample(wordsArray);
    setup.wordLength(words.wordInPlay);
  },
  wordLength: function (word) {
    _.each(word, function () {
      words.correctGuesses.push('_');
    });
  }
};

var play = {
  checkIfLost: function () {
    if (words.incorrectGuesses.length >= 5) {
      return true;
    };
  },
  checkIfWon: function () {
    if (words.correctGuesses.join('') === words.wordInPlay) {
      return true;
    };
  },
  haveAGo: function (input) {
    if (play.verifyInput(input)) {
      var isAlreadyIncorrect = _.find(words.incorrectGuesses, function (n) {
        return input === n;
      });
      var isAlreadyCorrect = _.find(words.correctGuesses, function (n) {
        return input === n;
      });
      if (isAlreadyCorrect || isAlreadyIncorrect) {
        console.log('That letter has already been guessed.');
      } else {
        play.checkGuess(input);
      };
    } else {
      console.log('invalid input, try again!');
    };
  },
  checkGuess: function (letter) {
    var numberRight = 0;
    for (var i = 0; i < words.wordInPlay.length; i++) {
      if (letter === words.wordInPlay[i]) {
        words.correctGuesses[i] = letter;
        numberRight++;
      };
    };
    if (numberRight === 0) {
      words.incorrectGuesses.push(letter);
      console.log(letter + ' was an incorrect guess');
    } else {
      console.log(letter + ' was correct ' + numberRight + ' times!');
    };
    console.log('puzzle: ' + words.correctGuesses);
    console.log('incorrect guesses: ' + words.incorrectGuesses);
  },
  verifyInput: function (input) {
    var letters = 'abcdefghijklmnopqrstuvwxyz'.split('');
    var valid = _.find(letters, function (letter) {
      return input === letter;
    });
    if (valid !== undefined && valid.length === 1) {
      return true;
    } else {
      return false;
    };
  }
};


$(document).ready(function () {

  setup.reset();

  var startMove = function () {
    $left = $('.left').html('');
    var $guesses = $('<p/>').addClass('guesses').text('Correct guesses: ' + words.correctGuesses);
    var $incorrect = $('<p/>').addClass('incorrectGuesses').text('Incorrect guesses: ' + words.incorrectGuesses);
    $left.append($guesses, $incorrect);
  };

  var haveTurn = function () {
    var $input = $('<input>').attr({
      'placeholder': 'Enter your guess here',
      'id': 'input'
    });
    var $button = $('<button>').attr('id','button').text('Try it!');
    $('.left').append($input, $button);
    $('#input').val('').focus();

    $('#button').on('click', function () {
      playMove();
    });

    $('#input').keypress(function(e) {
      if (e.keyCode === 13) {
        playMove();
      };
    });
  };

  var playMove = function () {
    var input = $('#input').val();
    play.haveAGo(input);
    startMove();
    if (play.checkIfLost() === true) {
      loser();
    } else if (play.checkIfWon() === true) {
      winner();
    } else {
      haveTurn();
    };
  };

  var addReset = function () {
    var $left = $('.left');
    var $resetButton = $('<div/>').addClass('resetButton').text('Play Again?');
    $left.append($resetButton);
    $resetButton.on('click', function () {
      setup.reset();
      startMove();
      haveTurn();
    })
  };

  var winner = function () {
    var $left = $('.left').html('');
    $left.append('<p/>').text('CONGRATS BRAH, YOU WON!');
    addReset();
  };

  var loser = function () {
    var $left = $('.left').html('');
    $left.append('<p/>').text('OMFG YOU LOST AT HANGMAN!!!!!');
    addReset();
  };

  startMove();
  haveTurn();




});
