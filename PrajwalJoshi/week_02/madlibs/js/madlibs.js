var button = document.getElementById('lib-button');

var makeMadLib = function(event){
  var noun =document.getElementById('noun').value;
  var adj =document.getElementById('adjective').value;
  var name =document.getElementById('person').value;
  var output = name+" really "+ adj +" "+ noun;
  console.log(output);

  var story = document.getElementById('story');
  story.innerHTML = output;

}

button.addEventListener('click',makeMadLib);
