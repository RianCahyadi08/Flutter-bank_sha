class SignUpFormModel {
  final String? name;
  final String? email;
  final String? password;
  final String? pin;
  final String? profilepicture;
  final String? ktp;

  SignUpFormModel({
    required this.name,
    required this.email,
    required this.password,
    this.pin,
    this.profilepicture,
    this.ktp,
  });

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'email': email,
      'password': password,
      'pin': pin,
      'profile_picture': profilepicture,
      'ktp': ktp,
    };
  }

  SignUpFormModel copyWith({
    String? pin,
    String? proficePicture,
    String? ktp,
  }) =>
      SignUpFormModel(
        name: name,
        email: email,
        password: password,
        pin: pin ?? this.pin,
        profilepicture: profilepicture ?? this.profilepicture,
        ktp: ktp ?? this.ktp,
      );
}
