var grains = [ "1" ];

var stringDouble = function (string) {
  var charArray = string.split('');
  var inPlaceDouble = _.map(charArray, function(char){
    return 2*parseInt(char);
  });
  var carry = 0;
  var result = [];
  for (var i = inPlaceDouble.length-1; i >= 0; i--) {
    var thisNum = inPlaceDouble[i] + carry;
    var ones = thisNum % 10;
    var tens = (thisNum-ones)/10
    result.unshift(ones);
    carry = tens;
  }
  if(carry){
    result.unshift(carry);
  }
  return _.reduce(result, function(sum, num){return sum+num;}, "");
}

for (var i = 1; i < 64; i++) {
   grains.push(stringDouble(_.last(grains)));
}
console.log(grains);

var totalPlusOne = stringDouble(_.last(grains));
var totalChars = totalPlusOne.split("");
totalChars[totalChars.length-1] = (parseInt(_.last(totalChars)) - 1) + "";
var total = totalChars.join("");

console.log(totalPlusOne);

$(document).ready( function () {

  $('#square').on('click', function(e) {
    number = parseInt($('#number').val());
    if (!number || number.isNaN || number<1 || number>64){
      $('#result').text("You need to input a number if you want my help.");
      return;
    }
    $('#result').text("There are " + grains[number-1] + " grains on that square.")
  });

  $('#all').on('click', function(e) {

  });



});
