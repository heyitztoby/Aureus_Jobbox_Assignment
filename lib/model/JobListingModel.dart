class JobListingModel {
  int companyId = 0;
  int jobListingId = 0;
  String companyName = '';
  String jobTitle = '';
  String salaryPerMonth = '';
  String location = '';
  String datePosted = '';
  String companyLogo = '';
  String jobDescription = '';
  String jobRequirements = '';

  JobListingModel({
    required this.companyId,
    required this.jobListingId,
    required this.companyName,
    required this.jobTitle,
    required this.salaryPerMonth,
    required this.location,
    required this.datePosted,
    required this.companyLogo,
    required this.jobDescription,
    required this.jobRequirements,
  });
}
