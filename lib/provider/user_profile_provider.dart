import 'package:flutter/foundation.dart';
import '../model/UserProfileModel.dart';

class UserProfileProvider with ChangeNotifier {
  UserProfileModel userProfileModel =
      UserProfileModel(email: '', fullName: '', mobileNumber: '');

  String get email => userProfileModel.email;
  String get fullName => userProfileModel.fullName;
  String get mobileNumber => userProfileModel.mobileNumber;

  void setEmail(String value) {
    userProfileModel.email = value;
    notifyListeners();
  }

  void setFullName(String value) {
    userProfileModel.fullName = value;
    notifyListeners();
  }

  void setMobileNumber(String value) {
    userProfileModel.mobileNumber = value;
    notifyListeners();
  }
}
