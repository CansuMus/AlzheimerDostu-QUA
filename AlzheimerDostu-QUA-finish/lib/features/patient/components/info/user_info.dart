class User {
  String? id;
  String? firstName;
  String? lastName;
  String? tcNo;
  String? gender;
  List<String>? medications;
  List<String>? hospitalAdmissions;
  String? additionalInfo;
  String? friendName;

  User({
    this.id,
    this.firstName,
    this.lastName,
    this.tcNo,
    this.gender,
    this.medications,
    this.hospitalAdmissions,
    this.additionalInfo,
    this.friendName,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      firstName: json['firstName'],
      lastName: json['lastName'],
      friendName:json['friendName'],

      tcNo: json['tcNo'],
      gender: json['gender'],
      medications: List<String>.from(json['medications'] ?? []),
      hospitalAdmissions: List<String>.from(json['hospitalAdmissions'] ?? []),
      additionalInfo: json['additionalInfo'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'firstName': firstName,
      'lastName': lastName,
      'friendName':friendName,
      'tcNo': tcNo,
      'gender': gender,
      'medications': medications,
      'hospitalAdmissions': hospitalAdmissions,
      'additionalInfo': additionalInfo,
    };
  }
}
