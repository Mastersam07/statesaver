class DebitCard {
  String? type;
  String? name;
  String? expiry;
  String? number;

  DebitCard({
    this.type,
    this.name,
    this.expiry,
    this.number,
  });

  DebitCard.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    name = json['name'];
    expiry = json['expiry'];
    number = json['number'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['type'] = type;
    data['name'] = name;
    data['expiry'] = expiry;
    data['number'] = number;
    return data;
  }
}
