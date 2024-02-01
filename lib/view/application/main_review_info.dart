import 'package:aureus_jobbox/provider/applied_job_listing_provider.dart';
import 'package:aureus_jobbox/provider/user_profile_provider.dart';
import 'package:aureus_jobbox/view/shared_widgets/widget_file_selected.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../constants.dart' as constants;
import '../../model/JobListingModel.dart';
import '../../provider/image_change_provider.dart';
import '../../provider/selected_job_listing_provider.dart';
import '../home/route_home.dart';
import '../shared_widgets/widget_linear_progressbar.dart';
import '../shared_widgets/widget_spacer.dart';

class ReviewInfoPage extends StatelessWidget {
  const ReviewInfoPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Variable to retrieve the selected job listing.
    JobListingModel selectedJobListing =
        context.read<SelectedJobListingProvider>().selectedListing;

    // Variable to store the height of the device screen.
    double deviceHeight = MediaQuery.of(context).size.height;

    return Theme(
        // Remove the divider line for the persistent footer buttons.
        data: Theme.of(context).copyWith(
            dividerTheme: const DividerThemeData(color: Colors.transparent)),
        child: Scaffold(
          appBar: AppBar(
              automaticallyImplyLeading: false,
              // Ensure the app bar height is 15% of the device screen's height.
              toolbarHeight: deviceHeight * 0.15,
              scrolledUnderElevation: 0.0,
              title: WidgetAppBar(selectedJobListing: selectedJobListing)),
          body: const SingleChildScrollView(
            child: InformationForReview(),
          ),
          persistentFooterButtons: [
            BottomButton(selectedJobListing: selectedJobListing),
          ],
        ));
  }
}

// Implementation of the app bar
class WidgetAppBar extends StatelessWidget {
  const WidgetAppBar({
    super.key,
    required this.selectedJobListing,
  });

  final JobListingModel selectedJobListing;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        _backButton(context),
        _jobApplicationTitle(),
        // Space adder
        WidgetSpacer(
          height: 20.0,
        ),
        _jobApplicationStage(),
        WidgetSpacer(
          height: 10.0,
        ),
        _jobApplicationProgressBar(),
      ],
    );
  }

  _backButton(BuildContext context) {
    return IconButton(
      padding: const EdgeInsets.only(right: 5.0),
      icon: const Icon(
        Icons.arrow_back_ios,
        color: constants.COLORS.black,
      ),
      // Return to previous page upon clicking.
      onPressed: () => Navigator.of(context).pop(),
    );
  }

  _jobApplicationTitle() {
    return Container(
        margin: const EdgeInsets.only(left: 5.0, right: 5.0),
        child: Text('Apply to ${selectedJobListing.companyName}',
            style: constants.STYLES.welcomeSloganStyle));
  }

  _jobApplicationStage() {
    return Container(
      margin: const EdgeInsets.only(left: 5.0, right: 5.0),
      child: const Text(
        constants.REVIEW_INFO,
        style: constants.STYLES.progressBarText,
      ),
    );
  }

  _jobApplicationProgressBar() {
    return Container(
      margin: const EdgeInsets.only(left: 5.0, right: 5.0),
      child:
          // Displaying 100% done for the progress bar.
          const WidgetLinearProgressBar(determinateValue: 1.0),
    );
  }
}

class InformationForReview extends StatelessWidget {
  const InformationForReview({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10.0, left: 20.0, right: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Space adder
          WidgetSpacer(
            height: 20.0,
          ),

          // Row that display contact info label and edit button
          const ContactInfoRow(),
          WidgetSpacer(height: 10.0),

          // Row that display user profile image.
          const ProfileImage(),
          WidgetSpacer(height: 10.0),

          // Container that display the user's contact information
          const UserContactInformation(),
          WidgetSpacer(height: 5.0),
          const Divider(
            color: constants.COLORS.grey,
            thickness: 0.2,
          ),
          WidgetSpacer(height: 5.0),

          // Row that display employment info label and edit button
          const EmploymentInfoRow(),
          WidgetSpacer(height: 15.0),

          _resumeLabel(),
          WidgetSpacer(height: 5.0),
          const WidgetFileSelected(fileType: 'Resume'),
          WidgetSpacer(height: 10.0),

          _coverLetterLabel(),
          WidgetSpacer(
            height: 5.0,
          ),
          const WidgetFileSelected(fileType: 'Cover Letter'),
          WidgetSpacer(height: 10.0),

          _additionalSkillsLabel(),
          WidgetSpacer(height: 5.0),
        ],
      ),
    );
  }

  _resumeLabel() {
    return const Text(constants.RESUME_LABEL,
        style: constants.STYLES.infoLabelsStyle);
  }

  _coverLetterLabel() {
    return const Text(constants.COVER_LETTER_LABEL,
        style: constants.STYLES.infoLabelsStyle);
  }

  _additionalSkillsLabel() {
    return const Text(constants.ADDITIONAL_SKILLS_LABEL,
        style: constants.STYLES.infoLabelsStyle);
  }
}

class ProfileImage extends StatelessWidget {
  const ProfileImage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Consumer<ImageChangeProvider>(
          builder: (context, imageChangeProvider, child) {
        return ClipRRect(
          child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            Container(
              width: 75,
              height: 75,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(75),
                // Conditional check to change border color if there is no picture
                border: Border.all(
                    color: imageChangeProvider.imageString.compareTo("") == 0
                        ? constants.COLORS.black
                        : Colors.transparent),
              ),
              child: Ink(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(75),
                  // Listener is implemented to detect any changes in profile image and show the changes accordingly.
                  image: DecorationImage(
                    image: NetworkImage(imageChangeProvider.imageString),
                    fit: BoxFit.fill,
                  ),
                ),
                child: Align(
                  child: Container(
                      child:
                          // Conditional check to have a default display if there is no profile image.
                          imageChangeProvider.imageString.compareTo("") == 0
                              ? const Text(
                                  constants.NO_PHOTO_LABEL,
                                  softWrap: true,
                                  textAlign: TextAlign.center,
                                  maxLines: 2,
                                  style: constants.STYLES.labelStyle,
                                )
                              : const Text("")),
                ),
              ),
            )
          ]),
        );
      }),
    );
  }
}

class ContactInfoRow extends StatelessWidget {
  const ContactInfoRow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [_contactInfoLabel(), _editIcon()],
    );
  }

  _contactInfoLabel() {
    return const Expanded(
      child: Text(
        constants.CONTACT_INFO,
        style: constants.STYLES.jobApplicationLabel,
      ),
    );
  }

  _editIcon() {
    return IconButton(
      icon: const Icon(
        Icons.edit,
        color: constants.COLORS.darkBrown,
      ),
      onPressed: () => {},
    );
  }
}

class UserContactInformation extends StatelessWidget {
  const UserContactInformation({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<UserProfileProvider>(
      builder: (context, userProfileProvider, child) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _fullNameLabel(),
            // Space adder
            WidgetSpacer(height: 5.0),
            _userFullName(userProfileProvider),

            WidgetSpacer(height: 15.0),

            _emailLabel(),
            WidgetSpacer(height: 5.0),
            _userEmail(userProfileProvider),

            WidgetSpacer(height: 15.0),

            _mobileNumberLabel(),
            WidgetSpacer(height: 5.0),
            _userMobileNumber(userProfileProvider),
          ],
        );
      },
    );
  }

  _fullNameLabel() {
    return const Text(
      constants.FULL_NAME_LABEL,
      style: constants.STYLES.infoLabelsStyle,
    );
  }

  _userFullName(UserProfileProvider userProfileProvider) {
    return Text(
      userProfileProvider.fullName,
      style: constants.STYLES.inputStyle,
    );
  }

  _emailLabel() {
    return const Text(
      constants.EMAIL_LABEL,
      style: constants.STYLES.infoLabelsStyle,
    );
  }

  _userEmail(UserProfileProvider userProfileProvider) {
    return Text(
      userProfileProvider.email,
      style: constants.STYLES.inputStyle,
    );
  }

  _mobileNumberLabel() {
    return const Text(
      constants.MOBILE_NUMBER_LABEL,
      style: constants.STYLES.infoLabelsStyle,
    );
  }

  _userMobileNumber(UserProfileProvider userProfileProvider) {
    return Text(
      userProfileProvider.mobileNumber,
      style: constants.STYLES.inputStyle,
    );
  }
}

class EmploymentInfoRow extends StatelessWidget {
  const EmploymentInfoRow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        _employmentInfoLabel(),
        _editButton(),
      ],
    );
  }

  _employmentInfoLabel() {
    return const Expanded(
      child: Text(
        constants.EMPLOYMENT_INFO,
        style: constants.STYLES.jobApplicationLabel,
      ),
    );
  }

  _editButton() {
    return IconButton(
      icon: const Icon(
        Icons.edit,
        color: constants.COLORS.darkBrown,
      ),
      onPressed: () => {},
    );
  }
}

class BottomButton extends StatelessWidget {
  const BottomButton({
    super.key,
    required this.selectedJobListing,
  });

  final JobListingModel selectedJobListing;

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.only(bottom: 30.0, left: 20.0, right: 20.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Consumer<AppliedJobListingProvider>(
                  builder: (context, appliedJobListingProvider, child) {
                return SizedBox(
                  height: 45,
                  child: ElevatedButton(
                    onPressed: () {
                      // Store the job listing applied to display in the Applied Jobs page.
                      appliedJobListingProvider
                          .addAppliedListing(selectedJobListing);

                      Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(builder: (context) => HomePage()),
                          (Route<dynamic> route) => false);
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: constants.COLORS.primary,
                        foregroundColor: constants.COLORS.white,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(7.0))),
                    child: const Text(
                      constants.SUBMIT,
                      style: constants.STYLES.normalButtonWordStyle,
                    ),
                  ),
                );
              }),
            )
          ],
        ));
  }
}
