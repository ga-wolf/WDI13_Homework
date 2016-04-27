// Create a new Javascript file and link to it with a script tag at the bottom.
// Add an event listener to the button so that it calls a makeMadLib function when clicked.
// In the makeMadLib function, retrieve the current values of the form input elements, make a story from them, and output that in the story div (like "Pamela really likes pink cucumbers.")


var heading = document.getElementsByTagName('h1')[0];
var mouselogger = function (event) { //callback
  // console.log(event); remove this once you find what you want
  console.log('x:', event.clientX, 'y:' event.clientY);
};

heading.addEventListener('mousemove', mouselogger); // heading node












 Joels Mad LIb Answer:
 // storing slots (DOM nodes) where value goes not values
 var button = document.getElementById("lib-button"); // called callbacks
 var storyDiv = document.getElementById("story");
 var noun = document.getElementById("noun");
 var adjective = document.getElementById("adjective");
 var someonesName = document.getElementById("person");

 var makeMadLib /*  explains what function does */ = function(event) {
  var story = [
    someonesName.value;
    'really likes',
    adjective.value,
    noun.value
  ].join(' ');

  storyDiv.innerHTML = <p> + story </p>;
 }
  button.addEventListener("click", makeMadLib); // never add () as I don't want to call function myself;


  // var button = document.getElementById("lib-button");
  // var makeMadLib = function(event) {
  //   var noun = document.getElementById("noun").value;
  //   var adjective = document.getElementById("adjective").value;
  //   var someonesName = document.getElementById("person").value;
  //     alert(noun + "\n" + adjective + "\n" + someonesName);
  //
  //     var story = document.getElementById("story");
  //     var bio = someonesName + " really likes " + adjective + noun + ".";
  //     story.innerHTML = bio;
  // }
  //  button.addEventListener("click", makeMadLib); // never add () as I don't want to call function myself;
