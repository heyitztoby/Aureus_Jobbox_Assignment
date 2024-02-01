import 'dart:io';

class UserProfileModel {
  String email = '';
  String fullName = '';
  String mobileNumber = '';

  List<File>? resume;
  List<File>? coverLetter;

  UserProfileModel(
      {required this.email,
      required this.fullName,
      required this.mobileNumber,
      this.resume,
      this.coverLetter});
}
