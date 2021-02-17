class AccountData {
  String firstName;
  String lastName;
  String email;
  double saving;
  double bonus;
  int berries;
  String id;
  String month;
  String city;
  double savingGoal;
  double savingStretchGoal;
  String phone;
  String postalCode;
  String address;

  AccountData({
    this.firstName = 'jack',
    this.lastName = '',
    this.saving = 0,
    this.bonus = 0,
    this.berries = 0,
    this.id = '',
    this.month = '',
    this.city = '',
    this.savingGoal = 0,
    this.savingStretchGoal = 0,
    this.phone = '',
    this.postalCode = '',
    this.email = '',
    this.address = '',
  });

  static AccountData accountdata = AccountData(
      saving: 1500,
      firstName: 'jack',
      lastName: 'ma',
      email: 'jasmine.li@gmail.com',
      bonus: 0.09,
      berries: 30);

  factory AccountData.fromJson(Map<String, dynamic> json) {
    return AccountData(
        firstName: json['first_name'],
        lastName: json['last_name'],
        email: json['email'],
        saving: json['saving'],
        id: json['id'],
        month: json['month'],
        berries: json['berries'],
        city: json['city'],
        postalCode: json['postalCode'],
        savingGoal: json['saving'],
        savingStretchGoal: json['saving'],
        address: json['address'],
        phone: json['phone'],
        bonus: json['bonus']);
  }
}
