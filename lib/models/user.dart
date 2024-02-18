class User {
  final String? firstName;
  final String? lastName;
  final String? email;
  final String? streetName;
  final String? noInt;
  final String? noExt;
  final String? zipCode;

  User(
    this.firstName,
    this.lastName,
    this.email,
    this.streetName,
    this.noInt,
    this.noExt,
    this.zipCode
  );

  User.fromJson(Map<String, dynamic> json)
      : firstName = json['firstName'] != null
          ? json['firstName'] as String
          : '',
        lastName = json['lastName'] != null
          ? json['lastName'] as String
          : '',
        email = json['email'] != null
          ? json['email'] as String
          : '',
        streetName = json['streetName'] != null
          ? json['streetName'] as String
          : '',
        noInt = json['noInt'] != null
          ? json['noInt'] as String
          : '',
        noExt = json['noExt'] != null
          ? json['noExt'] as String
          : '',
        zipCode = json['zipCode'] != null
          ? json['zipCode'] as String
          : '';

  Map<String, dynamic> toJson() => {
        'firstName': firstName,
        'lastName': lastName,
        'email': email,
        'streetName': streetName,
        'noInt': noInt,
        'noExt': noExt,
        'zipCode': zipCode,
      };

  @override
  String toString() {
    return "$firstName $lastName";
  }
}