accounts = {
  balance: {
  "checking"  :  100,
  "savings"  : 75,
  },
  deposit : function (account, amount) {
    accounts.balance[account] += amount;
  },
  withdrawal : function (account, amount) {
    if (amount <= accounts.balance[account]) {
      accounts.balance[account] -= amount;
    }
  },
  transfer: function (accountFrom, accountTo, amount) {
    if (amount <= accounts.balance[accountFrom]) {
      accounts.balance[accountFrom] -= amount;
      accounts.balance[accountTo] += amount;
    }
  },
  // overflowProtection : function (account1, account2) {
  //   return accounts.balance[account1] + accounts.balance[account2];
  // },

  inputAccount : function (account) {
    if (account === accounts.balance[checking]) {
      return accounts.balance[savings];
    } else if (account === accounts.balance[savings]) {
      return accounts.balance[checking];
    }
  }
};


$(document).ready(function () {
  displayBalance();
  $('#checking-deposit').on('click', function () {
    var depositAmount = $('#checking-amount').val();
    depositAmount = parseInt(depositAmount);
    accounts.deposit('checking', depositAmount);
    displayBalance();
  });
  $('#savings-deposit').on('click', function () {
    var depositAmount = $('#savings-amount').val();
    depositAmount = parseInt(depositAmount);
    accounts.deposit('savings', depositAmount);
    displayBalance();
  });
  $('#checking-withdraw').on('click', function () {
    var withdrawalAmount = $('#checking-amount').val();
    withdrawalAmount = parseInt(withdrawalAmount);
    console.log(withdrawalAmount);
    accounts.withdrawal('checking', withdrawalAmount);
    displayBalance();
  });
  $('#savings-withdraw').on('click', function () {
    var withdrawalAmount = $('#savings-amount').val();
    withdrawalAmount = parseInt(withdrawalAmount);
    accounts.withdrawal('savings', withdrawalAmount);
    displayBalance();
  });
});

var displayBalance = function() {
  $('#checking-balance').text('$'+accounts.balance['checking']);
  backgroundChecking();
  $('#savings-balance').text('$'+accounts.balance['savings']);
  backgroundSavings();
};

var backgroundChecking = function () {
  if (accounts.balance['checking'] === 0) {
    $('#checking-balance').css('background-color', 'red');
  } else {
    $('#checking-balance').css('background-color', '#E3E3E3');
  }
};

var backgroundSavings = function () {
  if (accounts.balance['savings'] === 0) {
    $('#savings-balance').css('background-color', 'red');
  } else {
    $('#savings-balance').css('background-color', '#E3E3E3');
  }
};


// save this into new variable in obj as => var self = this;
// $('a').on('click', function() {
// });
