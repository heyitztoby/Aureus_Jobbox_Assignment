import 'package:aureus_jobbox/model/JobListingModel.dart';
import 'package:flutter/material.dart';

class AppliedJobListingProvider extends ChangeNotifier {
  final List<JobListingModel> _appliedList = [];

  List<JobListingModel> get appliedList => _appliedList;

  void addAppliedListing(JobListingModel listing) {
    _appliedList.add(listing);
    notifyListeners();
  }
}
