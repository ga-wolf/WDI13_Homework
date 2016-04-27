
var checkingBalance = 0;
var savingsBalance = 0;
var totalBalance = 0;

$(document).ready(function() {

var zeroBalance = function(account) {
        if ($('#' + account).children('.balance').text() === '$0') {
            $('#' + account).css({'background':'red'});
        } else {
            $('#' + account).css({'background':'green'});
        }
};

zeroBalance('savings');
zeroBalance('checking');
zeroBalance('total');


var transact = function(num, account) {
    if (account === 'savings') {
      savingsBalance += num;
    } else if (account === 'checking') {
      checkingBalance += num;
  } totalBalance = checkingBalance + savingsBalance;
};

var update = function(account) {
      $('#savings-balance').text('$'+savingsBalance);
      $('#checking-balance').text('$'+checkingBalance);
      $('#total-balance').text('$'+totalBalance);
      $('#' +account).children('.customer').val('');
      zeroBalance('savings');
      zeroBalance('checking');
      zeroBalance('total');
};

$('.deposit').on('click', function() {
      var value = +$(this).siblings('.customer').val();
      var account = $(this).parent().attr('id');
      if (value > 0) {
           transact (value, account);
       } else {
          alert('Please only enter numbers greater than 0.');
    } update(account);
});

$('.withdraw').on('click', function() {
      var posValue = +$(this).siblings('.customer').val();
      var negValue = -1 * posValue;
      var currentAccount = $(this).parent().attr('id');
      var balanceStr = $(this).siblings('.balance').text();
      var balanceInt = balanceStr.slice(1);
      if (posValue <= balanceInt) {
           transact (negValue, currentAccount);
       } else if (posValue > 0) {
            overDraft(negValue, currentAccount);
       } else {
            alert('Please only enter numbers greater than 0.');
    } update(currentAccount);
});



var overDraft = function(num, account) {
    var altAccount = $('#'+account).siblings('.account').attr('id');
    if (-1 * num < totalBalance) {
        var thisBalance = $('#'+account).children('.balance').text();
        var availAmount = -(thisBalance.slice(1));
        var difference = num - availAmount;
        transact(availAmount, account);
        transact(difference, altAccount);
        alert('$' + -1 * difference + ' has been withdrawn from your ' + altAccount + ' account in order to complete the transaction.');
    } else {
        alert('You do not have enough money in your accounts for this transaction');
    }
};

$('.transfer').on('click', function() {
      var value = +$(this).siblings('.customer').val();
      var negValue = -1 * value;
      var currentAccount = $(this).parent().attr('id');
      var account = $(this).attr('id').slice(5);
      var altAccount = $(this).siblings('.transfer').attr('id').slice(5);
      if (value > 0) {
              if (value <= $('#'+account).children('.balance').text().slice(1)) {
                transact(negValue, account);
                transact(value, altAccount);
              } else {
                alert('The balance of your ' + account + " account is not sufficient to complete the transfer");
              }
      } else {
          alert('Please only enter numbers greater than 0.');
   } update(currentAccount);
});

});
