import 'package:aureus_jobbox/model/JobListingModel.dart';
import 'package:flutter/material.dart';

class SelectedJobListingProvider extends ChangeNotifier {
  JobListingModel _selectedListing = JobListingModel(
      companyId: 0,
      jobListingId: 0,
      companyName: '',
      jobTitle: '',
      salaryPerMonth: '',
      location: '',
      datePosted: '',
      companyLogo: '',
      jobDescription: '',
      jobRequirements: '');

  JobListingModel get selectedListing => _selectedListing;

  void setListing(JobListingModel listing) {
    _selectedListing = listing;
  }
}
