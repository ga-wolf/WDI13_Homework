for (var i = 0; i < 10; i++) {
  console.log(i);
}

for (var i = 0; i < 10; i++) {
  setTimeout(function() {
    console.log(i);
  }, 1000);
}

for (var i = 0; i < 10; i++) {
  setTimeout(function() {
    console.log(i);
  }, 1000*i);
}

for (var i = 0; i < 10; i++) {
  var wait = function (j) {
    setTimeout(function () {
      console.log(j);
    }, 1000*j);
  };

  wait(i);

 }


 for (var i = 0; i < 10; i++) {
   (function (j) {
     setTimeout(function () {
       console.log(j);
     }, 1000*j);
   })(i);
}
