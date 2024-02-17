class User {
  final String firstName;
  final String lastName;
  final String email;

  User(this.firstName, this.lastName, this.email);

  User.fromJson(Map<String, dynamic> json)
      : firstName = json['firstName'] as String,
        lastName = json['lastName'] as String,
        email = json['email'] as String;

  Map<String, dynamic> toJson() => {
        'firstName': firstName,
        'lastName': lastName,
        'email': email,
      };

  @override
  String toString() {
    return "$firstName $lastName";
  }
}