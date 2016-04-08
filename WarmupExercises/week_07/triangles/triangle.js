// I want to do this using an object called 'triangle' that will hold functions (each of which take three parameters - one for each side) for:

    // Checking to see if the valid is triangle (sum of any two sides must be > third);
    // Check to see if the triangle is equilateral;
    // Check to see if the triangle is isosceles;
    // Check to see if the triangle is scalene;
    // A single function to tell us what kind of triangle it is (rather than having to test each one ourselves);
    // Calculate the area using Heron's formula

// Create an object to store our functions
var triangle = {

    // Check if it's a valid triangle
    isValid: function(a,b,c) {
        if ((a + b >= c) && (b + c >= a) && (a + c >= b)) {
            return true;
        }
        return false;
    },

    // Check if it's equilateral
    isEquilateral: function(a,b,c) {
        if (this.isValid(a,b,c) &&
        a === b &&
        b === c) {
            return true;
        }
        return false;
    },

    // Check if it's isosceles
    isIsosceles: function(a,b,c) {
        if (this.isValid(a,b,c) &&
        !this.isEquilateral(a,b,c) &&
        ((a === b) || (b === c) || (a === c))) {
            return true;
        }
        return false;
    },

    // Check if it's scalene
    isScalene: function(a,b,c) {
        if (this.isValid(a,b,c) &&
        !this.isEquilateral(a,b,c) &&
        !this.isIsosceles(a,b,c)) {
            return true;
        }
    return false;
    },

    // Tell me what type of triangle it is
    type: function(a,b,c) {
        if (this.isEquilateral(a,b,c)) {
            return "it's equilateral";
        } else if (this.isIsosceles(a,b,c)) {
            return "it's isosceles";
        } else if (this.isScalene(a,b,c)) {
            return "it's scalene";
        } else if (!this.isValid(a,b,c)){
            // We don't actually need an "else if" here, since each of the functions first tests whether the triangle isValid. An "else" would suffice.
            return "it's invalid";
        }
    },

    // Calculate the area of the triangle (using Heron's formula)
    area: function(a,b,c) {
        var s = (a+b+c)*0.5;
        var area = Math.sqrt(s*(s-a)*(s*(s-b))*(s-c)); 
        return area;
    }
};

console.log(triangle.type(7,3,3));
console.log(triangle.area(5,5,5));
