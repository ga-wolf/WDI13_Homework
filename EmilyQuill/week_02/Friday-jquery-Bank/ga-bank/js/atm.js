var checkZero = function(input) {
 if (+input.html().slice(1) === 0) {
   input.addClass('red');
 } else {
   input.removeClass('red');
 }
};

var withdraw = function() {
  var $balanceWindow = $(this).prev().prev().prev();
  var $withdrawInput = $(this).prev().prev();
  var withdrawAmount = parseFloat($withdrawInput.val());
  var currentBalance = parseFloat($balanceWindow.html().slice(1));
  var newBalance = currentBalance - withdrawAmount;
  if (newBalance < 0) {
    if ( parseFloat($('#savings-balance').html().slice(1)) + parseFloat($('#checking-balance').html().slice(1)) >= withdrawAmount ) {
      var remainingWithdrawlAmount = withdrawAmount - currentBalance;
      var $otherAccount = $(this).closest('.account').siblings('.account').children('.balance');
      var otherBalance = parseFloat($otherAccount.html().slice(1));
      var newOtherBalance = otherBalance - remainingWithdrawlAmount;
      $balanceWindow.html('$0');
      $otherAccount.html('$' + newOtherBalance);
      $withdrawInput.val('');
      checkZero($balanceWindow);
      checkZero($otherAccount);
    } else {
      alert("Cannot withdraw - insufficient funds");
    }
  } else {
    $balanceWindow.html('$' + newBalance);
    $withdrawInput.val('');
    checkZero($balanceWindow);
  }
};

var deposit = function() {
  var $balanceWindow = $(this).prev().prev();
  var $depositInput = $(this).prev();
  var withdrawAmount = parseFloat($depositInput.val());
  var currentBalance = parseFloat($balanceWindow.html().slice(1));
  var newBalance = currentBalance + withdrawAmount;
  $balanceWindow.html('$' + newBalance);
  $depositInput.val('');
  checkZero($balanceWindow);

};

$('#savings-withdraw').on('click', withdraw);
$('#checking-withdraw').on('click', withdraw);
$('#savings-deposit').on('click', deposit);
$('#checking-deposit').on('click', deposit);
