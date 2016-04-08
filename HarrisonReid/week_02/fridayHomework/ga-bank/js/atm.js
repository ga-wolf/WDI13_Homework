// * Keep track of the checking and savings balances somewhere
// * Add functionality so that a user can deposit money into one of the bank accounts.
// * Make sure you are updating the display and manipulating the HTML of the page
// so a user can see the change.
// * Add functionality so that a user can withdrsaw money from one of the bank accounts.
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
// * Are there ways to refactor your code to make it DRYer? (**D**on't **R**epeat **Y**ourself)

ATM = {
  checkingBalance: 0,
  savingsBalance: 0,
  setUp: function() {
    // Called on page load
    this.updateAccountUI('Feel free to conduct a transaction.');
    this.assignButtonListeners();
  },
  assignButtonListeners: function() {
    // Assign listeners to deposit and withdraw buttons
    $('#checking-deposit').on('click', function() {
      var message = ATM.deposit("checking");
      ATM.updateAccountUI(message);
    });
    $('#checking-withdraw').on('click', function() {
      var message = ATM.withdraw("checking");
      ATM.updateAccountUI(message);
    });
    $('#savings-deposit').on('click', function() {
      var message = ATM.deposit("savings");
      ATM.updateAccountUI(message);
    });
    $('#savings-withdraw').on('click', function() {
      var message = ATM.withdraw("savings");
      ATM.updateAccountUI(message);
    });
  },
  updateAccountUI: function(message) {
    // Check provided account balance and update the UI as appropriate, to be called after every successful account transaction.
    var checkingDisplay = $('#checking-balance');
    var savingsDisplay = $('#savings-balance');

    var checkZeroBalance = function(account, accountObject) {
      if (ATM.getBalance(account) === 0 && !accountObject.hasClass('zero')) {
        accountObject.addClass('zero');
      } else if (ATM.getBalance(account) > 0 && accountObject.hasClass('zero')) {
        accountObject.removeClass('zero');
      }
    };

    $(checkingDisplay).text("$" + this.getBalance('checking'));
    $(savingsDisplay).text("$" + this.getBalance('savings'));
    checkZeroBalance('checking',checkingDisplay);
    checkZeroBalance('savings', savingsDisplay);

    // APPEND THE MESSAGE TO MESSAGE AREA ON SCREEN...
    $('#message').text(message);
  },

  getBalance: function (account) {
    if (account === "checking") {
      return this.checkingBalance;
    } else if (account === "savings") {
      return this.savingsBalance;
    }
  },
  setBalance: function (account, amount) {
    if (account === "checking") {
      this.checkingBalance = amount;
    } else if (account === "savings") {
      this.savingsBalance = amount;
    }
  },
  getInputAmount : function (account) {
    var amount;
    // Get the stored amount.
    if (account === 'savings') {
      amount = $('#savings-amount').val();
    } else if (account === 'checking') {
      amount = $('#checking-amount').val();
    }
    return parseInt(amount);
  },
  deposit: function(account) {
    // Deposit into account - returns message stating if success or transaction failed
    var requestedDeposit = this.getInputAmount(account);
    // Check account that's required.
    if (account === 'savings') {
      this.savingsBalance += requestedDeposit;
      return "Succesful deposit: $" + requestedDeposit;
    } else if (account === 'checking') {
      this.checkingBalance += requestedDeposit;
      return "Succesful deposit: $" + requestedDeposit;
    }
  },
  withdraw: function(account) {
    // Withdraw from account - returns message stating if success or transaction failed
    var requestedWithdraw = this.getInputAmount(account);
    var accountBalance = this.getBalance(account);
    var overallBalance = this.getBalance('checking') + this.getBalance('savings');
    // Reject transaction if overall balance too low
    if (overallBalance < requestedWithdraw) {
      return "Withdrawl failed. Insufficient funds.";
    } else if (accountBalance >= requestedWithdraw) { // If enough in requested account, transact.
      this.setBalance(account, (accountBalance - requestedWithdraw));
      return "Successful withdrawl from " + account + ": $" + requestedWithdraw;
    } else { // Else if enough in both withdraw from both
      this.setBalance(account, 0);
      if (account === 'savings') {
        this.setBalance('checking', (overallBalance - requestedWithdraw));
        return "Successful withdrawl. Savings account had Insufficient funds, the remainder has been withdrawn from checking account. Total withdrawl: $" + requestedWithdraw;
      } else if (account === 'checking') {
        this.setBalance('savings', (overallBalance - requestedWithdraw));
        return "Successful withdrawl. Checking account had Insufficient funds, the remainder has been withdrawn from savings account. Total withdrawl: $" + requestedWithdraw;
      }
    }
  }
};

$(document).ready(function() {
  ATM.setUp();
});
