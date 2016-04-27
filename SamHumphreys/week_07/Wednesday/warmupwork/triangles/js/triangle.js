// Triangles
// The program should return whether it a triangle is equilateral, isosceles or scalene. The program should also raise an error if the triangle cannot exist.
//
// Extensions:
//
// Return the area and diameter as well
// Hint
//
// The sum of the lengths of any two sides of a triangle always exceeds the length of the third side, a principle known as the triangle inequality.

var scalene = [3,4,5];
var notATriangle = [1,1,3];
var isosceles = [5,1,5];
var equilateral = [3,3,3];

var doStuff = {
  checkInequality: function (a,b,c) {
    if ( (a+b >= c) && (a+c >= b) && (c+b >= a) ) {
      return true;
    } else {
      return false;
    };
  },

  getBorder: function (a,b,c) {
    var border = a + b + c;
    return border;
  },

  checkIfIsosceles: function (a,b,c) {
    if ( (a===b) || (a===c) || (b===c) ) {
      return true;
    } else {
      return false;
    };
  },

  checkEquilateral: function (a,b,c) {
    if ( a=== b && b=== c) {
      return true;
    } else {
      return false;
    };
  },

  checkScalene: function (a,b,c) {
    if ( a!==b && b!==c && c!== a) {
      return true;
    } else {
      return false;
    }
  },

  runIt: function (a,b,c) {

    console.log("You are checking a triangle with sides " + a + ', ' + b + ', and ' + c);

    if ( doStuff.checkInequality(a,b,c) ) {
      console.log("This is a valid triangle");
    } else {
      console.log("This is not a valid triangle.");
      return;
    }

    console.log("The border length is " + doStuff.getBorder(a,b,c));

    if ( doStuff.checkEquilateral(a,b,c) ) {
      console.log("The triangle is Equilateral");
      return
    } else {
      console.log("The triangle is not Equilateral");
    };
    if ( doStuff.checkIfIsosceles(a,b,c) ) {
      console.log("The triangle is an Isosceles");
      return
    } else {
      console.log("The triangle is not Isosceles");
    };
    if ( doStuff.checkScalene(a,b,c) ) {
      console.log("It is a scalene triangle");
      return;
    } else {
      console.log("I dunno man, I'm confused.");
      return;
    };
  }
};
