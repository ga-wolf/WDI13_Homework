//copy **Do not use**

$(document).ready(function() {

  $newBalanceChecking = [];
  $newBalanceSavings = [];

  ///// Checking Deposit /////
  $('#checking-deposit').on('click', function() {

    $money = $('#checking-amount').val();
    $newBalanceChecking.push($money);
    $total = 0;
    for (var i = 0; i < $newBalanceChecking.length; i++) {
      $total += $newBalanceChecking[i] << 0;
    }

    if ($total > 0) {
      $('#savings-balance').css('background-color', '#E3E3E3');
      $('#content').css('background-color', 'white');
    }
    // else {
    //   $('#savings-balance').css('background-color','red');
    // }
    $('#checking-balance').text('$' + $total);

  });

  $('#checking-withdraw').on('click', function() {
    $money = $('#checking-amount').val();

    $total = 0;
    for (var k = 0; k < $newBalanceChecking.length; k++) {
      $total += $newBalanceChecking[k] << 0;
    }
    if ($total > $money) {

      $withdrawBalance = ($total - $money);
    }


    if ($total < $money) {
      $withdrawBalanceSavings = 0;
      for (var x = 0; x < $newBalanceSavings.length; x++) {
        $withdrawBalanceSavings += $newBalanceSavings[x] << 0;

        if ($withdrawBalance >= 1) {
          $('#checking-balance').css({
            'background-color': '#E3E3E3'
          });
          $('#content').css({
            'background-color': 'white'
          });
        }
        if ($withdrawBalance === 0) {
          $('#checking-balance').css({
            'background-color': 'red'
          });
        }

        if ($withdrawBalanceSavings < $money) {
          alert("You have insufficient funds");
        } else {
          $newBalanceChecking = [];

          $withdrawBalance = 0;
          $withdrawBalanceSavings = ($withdrawBalanceSavings - $money);

          $newBalanceChecking.push($withdrawBalance);

          $('#savings-balance').text('$' + $withdrawBalanceSavings);

        }
      }

    }

    if ($withdrawBalance >= 1) {
      $('#checking-balance').css({
        'background-color': '#E3E3E3'
      });
      $('#content').css({
        'background-color': 'white'
      });
    } else {
      $('#checking-balance').css({
        'background-color': 'red'
      });
    }

    $newBalanceChecking = [];

    $newBalanceChecking.push($withdrawBalance);

    $('#checking-balance').text('$' + $withdrawBalance);

  });

  ///// Savings Deposit /////
  $('#savings-deposit').on('click', function() {
    $money = $('#savings-amount').val();
    $newBalanceSavings.push($money);
    $total = 0;
    for (var j = 0; j < $newBalanceSavings.length; j++) {
      $total += $newBalanceSavings[j] << 0;
    }

    if ($total > 0) {
      $('#savings-balance').css('background-color', '#E3E3E3');
      $('#content').css('background-color', 'white');
    }

    $('#savings-balance').text('$' + $total);
  });

  $('#savings-withdraw').on('click', function() {
    $money = $('#savings-amount').val();

    $total = 0;
    for (var y = 0; y < $newBalanceSavings.length; y++) {
      $total += $newBalanceSavings[y] << 0;
    }

    if ($total > $money) {
      $withdrawBalance = ($total - $money);
    } else {
      $withdrawBalanceChecking = 0;
      for (var x = 0; x < $newBalanceChecking.length; x++) {
        $withdrawBalanceChecking += $newBalanceChecking[x] << 0;

        if ($withdrawBalanceChecking < $money) {
          alert("You have insufficient funds");
        } else {
          $newBalanceSavings = [];

          $withdrawBalance = 0;
          $withdrawBalanceChecking = ($withdrawBalanceChecking - $money);

          $newBalanceSavings.push($withdrawBalanceChecking);

          $('#savings-balance').css('background-color', 'red');
          if ($withdrawBalance === 0) {
            $('#savings-balance').css('background-color', '#E3E3E3');
            $('#content').css('background-color', 'white');
          } else {
            $('#savings-balance').css('background-color', 'red');
          }

          $('#checking-balance').text('$' + $withdrawBalanceChecking);
        }
      }
    }

    $newBalanceSavings = [];

    $newBalanceSavings.push($withdrawBalance);
    // } else { alert("You have insufficient funds."); }

    $('#savings-balance').text('$' + $withdrawBalance);

    if ($total >= 1) {
      $('#savings-balance').css({
        'background-color': '#E3E3E3'
      });
      $('#content').css('background-color', 'white');
    } else {
      // if ($withdrawBalance <= 0){
      $('#savings-balance').css({
        'background-color': 'red'
      });
    }
  });
});
