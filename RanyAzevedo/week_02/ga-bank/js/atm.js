// * Keep track of the checking and savings balances somewhere
// * Add functionality so that a user can deposit money into one of the bank accounts.
// * Make sure you are updating the display and manipulating the HTML of the page
// so a user can see the change.
// * Add functionality so that a user can withdraw money from one of the bank accounts.
// * Make sure you are updating the display and manipulating the HTML of the page
// so a user can see the change.
// * Make sure the balance in an account can't go negative. If a user tries to
// withdraw more money than exists in the account, ignore the transaction.
// * When the balance of the bank account is $0 the background of that bank account
// should be red. It should be gray when there is money in the account.

// * What happens when the user wants to withdraw more money from the checking
// account than is in the account? These accounts have overdraft protection, so if
// a withdrawal can be covered by the balances in both accounts, take the checking
// balance down to $0 and take the rest of the withdrawal from the savings account.
// If the withdrawal amount is more than the combined account balance, ignore it.
// * Make sure there is overdraft protection going both ways.


$(document).ready(function() {
  //Deposit Checking

  $('#checking-deposit').on('click', function() {
    var $amount = +$('#checking-amount').val().replace("$", "");
    var $balance = +$('#checking-balance').html().replace("$", "");
    if ($balance >= 0) {
      $balance += $amount;
      $('#checking-balance').html("$" + $balance);
      $('#checking-balance').css('background-color', '#E3E3E3');
    }
  });

  //Withdraw Checking
  $('#checking-withdraw').on('click', function() {
    var $amount = +$('#checking-amount').val().replace("$", "");
    var $balance = +$('#checking-balance').html().replace("$", "");
    if ($amount == $balance) {
      $('#checking-balance').css('background-color', 'red');
      $balance -= $amount;
      $('#checking-balance').html("$" + $balance);
    } else if ($amount < $balance) {
      $balance -= $amount;
      $('#checking-balance').html("$" + $balance);
    } else if (($amount > $balance) && ($amount <= (+$('#savings-balance').html().replace("$", "")))) {
      var checkingBalanceRest = ($amount - $balance);
      var savingsBalance = (+$('#savings-balance').html().replace("$", "")) - checkingBalanceRest;
      $('#savings-balance').html("$" + savingsBalance);
      $('#checking-balance').html("$" + 0);
    } else {
      $('#checking-balance');
    }
  });

  // Deposit Savings
  $('#savings-deposit').on('click', function() {
    var $amount = +$('#savings-amount').val().replace("$", "");
    var $balance = +$('#savings-balance').html().replace("$", "");
    if ($balance >= 0) {
      $balance += $amount;
      $('#savings-balance').html("$" + $balance);
      $('#savings-balance').css('background-color', '#E3E3E3');

    }
  });

  //Withdraw Savings
  $('#savings-withdraw').on('click', function() {
    var $amount = +$('#savings-amount').val().replace("$", "");
    var $balance = +$('#savings-balance').html().replace("$", "");
    if ($amount === $balance) {
      $('#savings-balance').css('background-color', 'red');
      $balance -= $amount;
      $('#savings-balance').html("$" + $balance);
    } else if ($amount < $balance) {
      $balance -= $amount;
      $('#savings-balance').html("$" + $balance);
    } else if (($amount > $balance) && ($amount <= (+$('#checking-balance').html().replace("$", "")))) {
      var checkingBalanceRest = ($amount - $balance);
      var savingsBalance = (+$('#checking-balance').html().replace("$", "")) - checkingBalanceRest;
      $('#checking-balance').html("$" + savingsBalance);
      $('#savings-balance').html("$" + 0);
    } else {
      $('#savings-balance');
    }
  });

});
