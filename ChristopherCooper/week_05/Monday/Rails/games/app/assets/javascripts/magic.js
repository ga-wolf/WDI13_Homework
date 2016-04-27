$(document).ready(function(){
  $( ".magic-question-field" ).keyup(function() {
    var x = $(".magic-question-field").val().slice(-1);
    console.log(x);
    if ( x !== '?')
    {
      $(".magic-question-submit").attr('disabled', true);
    }
    else
    {
      $(".magic-question-submit").attr('disabled', false);
    }
  });

})
