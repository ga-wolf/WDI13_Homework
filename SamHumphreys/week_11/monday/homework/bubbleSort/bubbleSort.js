var array = [13,1,7,3,2,0,6,2,4,6,7,1,6];
var copy = array.slice(0);
console.log(array);
var attempts = 0;

var bubbleSort = function (array) {

 //  For I = 0 to N - 2
 //   For J = 0 to N - 2
 //     If (A(J) > A(J + 1)
 //       Temp = A(J)
 //       A(J) = A(J + 1)
 //       A(J + 1) = Temp
 //     End-If
 //   End-For
 // End-For

  for (var i = 0; i < array.length-1; i ++) {
    for (var j = 0; j < array.length-i; j ++) {
      if (array[j] > array[j+1]) {
        var temp = array[j];
        array[j] = array[j+1];
        array[j+1] = temp;
      };
      attempts++;
    };
  };
};

bubbleSort(array);
console.log(array);
console.log(attempts);
