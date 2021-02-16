class AccountData {
  AccountData({
    this.firstName = '',
    this.lastName = '',
    this.email = '',
    this.balance = 0,
    this.berryAmt = 0,
    this.bonus = 0.00,
  });
  String firstName;
  String lastName;
  String email;
  double balance;
  double bonus;
  int berryAmt;

  static AccountData accountdata = AccountData(
      balance: 1500,
      firstName: 'jack',
      lastName: 'ma',
      email: 'jasmine.li@gmail.com',
      bonus: 0.09,
      berryAmt: 30);
}
