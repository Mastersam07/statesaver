class Beneficiary {
  String? name;
  String? accountNumber;
  String? bank;

  Beneficiary({this.name, this.accountNumber, this.bank});

  Beneficiary.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    accountNumber = json['accountNumber'];
    bank = json['bank'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['accountNumber'] = accountNumber;
    data['bank'] = bank;
    return data;
  }
}
