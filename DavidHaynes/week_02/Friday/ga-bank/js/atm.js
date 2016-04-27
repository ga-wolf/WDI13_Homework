
var checkingBalance = 0;
var savingsBalance = 0;

$(document).ready(function() {

var zeroBalance = function () {
      if (checkingBalance === 0) {
            $('#checking').css({'background':'red'});
      } else if (checkingBalance > 0) {
            $('#checking').css({'background':'green'});
      }

      if (savingsBalance === 0) {
            $('#savings').css({'background':'red'});
      } else if (savingsBalance > 0) {
            $('#savings').css({'background':'green'});
      }
};

zeroBalance();

var deposit = function(num, account) {
      if (account === 'savings') {
        savingsBalance += num;
      } else if (account === 'checking') {
        checkingBalance += num;
      }
};

var withdraw = function(num, account) {
      if (account === 'savings') {
        savingsBalance -= num;
      } else if (account === 'checking') {
        checkingBalance -= num;
      }
};


$('#savings-deposit').on('click', function() {
        var value = +$('#savings-amount').val();
        if (value > 0) {
             deposit (value, 'savings');
            $('#savings-balance').text(savingsBalance);
            $('#savings-amount').val('');
         } else {
            alert('Please only enter numbers greater than 0.');
      } zeroBalance();
});

$('#checking-deposit').on('click', function() {
        var value = +$('#checking-amount').val();
        if (value > 0) {
             deposit (value, 'checking');
             $('#checking-balance').text(checkingBalance);
             $('#checking-amount').val('');
        } else {
            alert('Please only enter numbers greater than 0.');
      } zeroBalance();
});

$('#savings-withdraw').on('click', function() {
        var value = +$('#savings-amount').val();
        if (value <= savingsBalance) {
             withdraw (value, 'savings');
             $('#savings-balance').text(savingsBalance);
             $('#savings-amount').val('');
        } else if (value > 0) {
             overDraftSavings(value);
             $('#savings-amount').val('');
        } else {
             alert('Please only enter numbers greater than 0.');
      } zeroBalance();
});

$('#checking-withdraw').on('click', function() {
        var value = +$('#checking-amount').val();
        if (value <= checkingBalance) {
             withdraw (value, 'checking');
             $('#checking-balance').text(checkingBalance);
             $('#checking-amount').val('');
        } else if (value > 0) {
             overDraftChecking(value);
             $('#checking-amount').val('');
        } else {
             alert('Please only enter numbers greater than 0.');
      } zeroBalance();
});

var overDraftChecking = function(num) {
      var totalBalance = savingsBalance + checkingBalance;
      if (num < totalBalance) {
            var difference = num - checkingBalance;
            checkingBalance = 0;
            withdraw(difference, 'savings');
            $('#checking-balance').text(checkingBalance);
            $('#savings-balance').text(savingsBalance);
            alert('$' + difference + ' has been withdrawn from your savings account in order to complete the transaction.');
      } else {
            alert('You do not have enough money in your accounts for this transaction');
      }
};

var overDraftSavings = function(num) {
      var totalBalance = savingsBalance + checkingBalance;
      if (num < totalBalance) {
            var difference = num - savingsBalance;
            savingsBalance = 0;
            withdraw(difference, 'checking');
            $('#checking-balance').text(checkingBalance);
            $('#savings-balance').text(savingsBalance);
            alert('$' + difference + ' has been withdrawn from your checking account in order to complete the transaction.');
      } else {
            alert('You do not have enough money in your accounts for this transaction');
      }
};














});
