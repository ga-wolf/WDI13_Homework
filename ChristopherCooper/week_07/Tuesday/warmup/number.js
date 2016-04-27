



var accumulate = function(num1, num2, num3, num4, num5){

  var numArr = [num1, num2, num3, num4, num5];

  var squares = [];
  var squareRoots = [];
  var cubes = []
  var evenAndOdd = [];


  for (var i = 0; i < numArr.length; i++){
    squares.push(numArr[i] * numArr[i]);
    squareRoots.push(Math.sqrt(numArr[i]));
    cubes.push(numArr[i] * numArr[i] * numArr[i]);

    if ((numArr[i] % 2) === 0){
      evenAndOdd.push(true);
    } else {
      evenAndOdd.push(false);
    }


  }

  console.log(squares);
  console.log(squareRoots);
  console.log(cubes);
  console.log(evenAndOdd);

};
