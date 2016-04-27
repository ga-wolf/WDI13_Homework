//
// btn.onclick = function() {
//   console.log('clicked');
//   var userInput = document.getElementById('input').value;
//   var url = "http://omdbapi.com?t=" + userInput;
//   var request = new XMLHttpRequest();
//   request.open('GET', url);
//   request.send();
//
//   request.onreadystatechange = function() {
//     if (request.readyState === 4) {
//       var info = JSON.parse(request.responseText);
//       var poster = document.getElementById("poster");
//       poster.src = info.Poster;
//     }
//   };
// };

btn.onclick = function() {
  var userInput = document.getElementById('input').value;
  var url = "http://omdbapi.com?s=" + userInput;
  var request = new XMLHttpRequest();
  request.open('GET', url);
  request.send();

  request.onreadystatechange = function() {
    if (request.readyState === 4) {
      var info = JSON.parse(request.responseText);
      console.log(info.Search[0].Title);
        var oneMovie = info.Search[0].Title;
        var onePoster = info.Search[0].Poster;
        var twoMovie = info.Search[1].Title;
        var twoPoster = info.Search[1].Poster;
        var threeMovie = info.Search[2].Title;
        var threePoster = info.Search[2].Poster;
        var fourMovie = info.Search[3].Title;
        var fourPoster = info.Search[3].Poster;
        var fiveMovie = info.Search[4].Title;
        var fivePoster = info.Search[4].Poster;
        var sixMovie = info.Search[5].Title;
        var sixPoster = info.Search[5].Poster;
        var sevenMovie = info.Search[6].Title;
        var sevenPoster = info.Search[6].Poster;
        var eightMovie = info.Search[7].Title;
        var Poster = info.Search[7].Poster;
        var nineMovie = info.Search[8].Title;
        var ninePoster = info.Search[8].Poster;
        var tenMovie = info.Search[9].Title;
        var tenPoster = info.Search[9].Poster;
        var one = document.getElementById('one');
        var newOne = one.getElementsByTagName('a');
        var two = document.getElementById('two');
        var newTwo = two.getElementsByTagName('a');
        var three = document.getElementById('three');
        var newThree = three.getElementsByTagName('a');
        var four = document.getElementById('four');
        var newFour = four.getElementsByTagName('a');
        var five = document.getElementById('five');
        var newFive = five.getElementsByTagName('a');
        var six = document.getElementById('six');
        var newSix = six.getElementsByTagName('a');
        var seven = document.getElementById('seven');
        var newSeven = seven.getElementsByTagName('a');
        var eight = document.getElementById('eight');
        var newEight = eight.getElementsByTagName('a');
        var nine = document.getElementById('nine');
        var newNine = nine.getElementsByTagName('a');
        var ten = document.getElementById('ten');
        var newTen = ten.getElementsByTagName('a');
        one.innerHTML = oneMovie;
        two.innerHTML = twoMovie;
        three.innerHTML = threeMovie;
        four.innerHTML = fourMovie;
        five.innerHTML = fiveMovie;
        six.innerHTML = sixMovie;
        seven.innerHTML = sevenMovie;
        eight.innerHTML = eightMovie;
        nine.innerHTML = nineMovie;
        ten.innerHTML = tenMovie;

        one.onclick = function(){
          var poster = document.getElementById("poster");
          poster.src = onePoster;
        };
        two.onclick = function(){
          var poster = document.getElementById("poster");
          poster.src = twoPoster;
        };
        three.onclick = function(){
          var poster = document.getElementById("poster");
          poster.src = threePoster;
        };
        four.onclick = function(){
          var poster = document.getElementById("poster");
          poster.src = fourPoster;
        };
        five.onclick = function(){
          var poster = document.getElementById("poster");
          poster.src = fivePoster;
        };
        six.onclick = function(){
          var poster = document.getElementById("poster");
          poster.src = sixPoster;
        };
        seven.onclick = function(){
          var poster = document.getElementById("poster");
          poster.src = sevenPoster;
        };
        eight.onclick = function(){
          var poster = document.getElementById("poster");
          poster.src = eightPoster;
        };
        nine.onclick = function(){
          var poster = document.getElementById("poster");
          poster.src = ninePoster;
        };
        ten.onclick = function(){
          var poster = document.getElementById("poster");
          poster.src = tenPoster;
        };
      }

  };
};
