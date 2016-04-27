// Create an object called 'Grains' for all our logic.

var Grains = {

    // Use Underscore's _.range method to create an array with 64 elements (starting with 1), each one representing a square on the chess board. When two parameters are passed into the _.range method, the range is created from argument 1 (inclusive) to argument 2 (exclusive).
    range: _.range(1, 65),

    // The square function is used to calculate the number of grains on the square passed in as an argument.
    square: function(n) {
        return Math.pow(2, n-1);
    },

    // The all function is used to calculate the number of grains on EACH square of the board.
    all: function() {
        // Our range helpfully specifies both the number representing each square (the value of each element) and the number of times we want to perform the calculation (the length of the array range - 64). For each element in the range, execute a function passing in the value of the element in range.
        _.each(Grains.range, function(i) {
            // On each iteration, call the Grains.square function, passing in the value of this element in the array.
            var grains = Grains.square(i);
            // Append both the element in the range array and the grains variable to the results div.
            $("#result").append(i + ': ' + grains + '<br>');
        });
    },


    // The totals is used to calculate the total number of grains on the board.
    total: function() {

        // Reduce is equivilent to the reduce and inject methods in Ruby. For each element in Grains.range array, take the value of 'sum' (which is initialized to 0) and add to that the number of grains on this square. Return this total back to the reduce method, and repeat (with the updated value of sum)). Return the final result.
        return _.reduce(Grains.range, function(sum, num) {
            return sum + Grains.square(num);
        }, 0);
    }
};

// Interaction code wrapped in document.ready to ensure all the elements first exist.

$(document).ready(function() {

    $("#square").on("click", function(e) {
        var n = parseInt($("#square").val());
        $("#result").text('');
        $("#result").text("Result is " + Grains.square(n));
    });

    $("#total").on("click", function(e) {
        $("#result").text("");
        $("#result").text(Grains.total());
    });

    $("#all").on("click", function(e) {
        $("#result").text('');
        $("#result").text(Grains.all());
    });

});
