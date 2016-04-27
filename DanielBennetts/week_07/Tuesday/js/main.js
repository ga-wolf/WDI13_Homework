  $(document).ready(function() {

    $('#pokemon-lookup').on('submit', function(event) {

      event.preventDefault();

      var pokeName = $('.input-group').children().val().toLowerCase();
      var pokeURL = 'http://pokeapi.co/api/v2/pokemon/' + pokeName;
      $.ajax(pokeURL).done(function(data) {
        var $h2 = $('<h2> The results are:' + data.name + '</h2>');
        $('#result').html($h2);
      });
    });

  });
