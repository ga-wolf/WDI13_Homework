var reverse = function (array) {
  result = []
  for (var i = 0; i < array.length; i++) {
    result.unshift(array[i]);
  }
  return result;
}

console.log(reverse([1,2,3,4]));

var isArray = function(variable) {
  if(Array.isArray){
    return Array.isArray(variable);
  } else {
    return Object.prototype.toString.call( array[i] ) === '[object Array]';
  }
}

var flatten = function (array) {
  result = []
  for (var i = 0; i < array.length; i++) {
    if( isArray(array[i]) ) {
      for (var j = 0; j < array[i].length; j++) {
        result.push(array[i][j]);
      }
    } else {
      result.push(array[i]);
    }
  }
  return result;
}

console.log(flatten([1, 2, [3, 4]]));
