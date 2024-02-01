import 'package:aureus_jobbox/provider/include_resume_for_education_provider.dart';
import 'package:aureus_jobbox/provider/include_resume_for_work_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../constants.dart' as constants;
import '../../model/JobListingModel.dart';
import '../../provider/selected_job_listing_provider.dart';
import '../shared_widgets/widget_linear_progressbar.dart';
import '../shared_widgets/widget_spacer.dart';
import 'main_review_info.dart';

class EmploymentInfoPage extends StatefulWidget {
  const EmploymentInfoPage({super.key});

  @override
  State<EmploymentInfoPage> createState() => _EmploymentInfoPageState();
}

class _EmploymentInfoPageState extends State<EmploymentInfoPage> {
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
              child: EducationAndWorkExperienceInfo()),
          persistentFooterButtons: const [
            BottomButton(),
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
        constants.EMPLOYMENT_INFO,
        style: constants.STYLES.progressBarText,
      ),
    );
  }

  _jobApplicationProgressBar() {
    return Container(
      margin: const EdgeInsets.only(left: 5.0, right: 5.0),
      child:
          // Displaying 70% done for the progress bar.
          const WidgetLinearProgressBar(determinateValue: 0.7),
    );
  }
}

class EducationAndWorkExperienceInfo extends StatelessWidget {
  const EducationAndWorkExperienceInfo({
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
            height: 10.0,
          ),
          _educationLabel(),
          // Row that includes resume for education and its respective toggle switch.
          const RowToIncludeEducation(),

          // User input fields that will display/hide based on the switch toggled.
          AdditionalEducationInformation(),
          WidgetSpacer(height: 25.0),
          _workExpLabel(),

          // Row that includes resume for work experience and its respective toggle switch.
          const RowToIncludeWork(),

          // User input fields that will display/hide based on the switch toggled.
          AdditionalWorkExperienceInformation(),
          WidgetSpacer(height: 25.0),
          _additionalSkillsLabel(),
          const WidgetSearchBar()
        ],
      ),
    );
  }

  _educationLabel() {
    return const Text(
      constants.EDUCATION_LABEL,
      style: constants.STYLES.jobApplicationLabel,
    );
  }

  _workExpLabel() {
    return const Text(
      constants.WORK_EXP_LABEL,
      style: constants.STYLES.jobApplicationLabel,
    );
  }

  _additionalSkillsLabel() {
    return const Text(
      constants.ADDITIONAL_SKILLS_LABEL,
      style: constants.STYLES.jobApplicationLabel,
    );
  }
}

class RowToIncludeEducation extends StatelessWidget {
  const RowToIncludeEducation({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<IncludeResumeForEducationProvider>(
        builder: (context, includeEducationProvider, child) {
      return Row(
        children: [
          // Text and switch to include education in resume.
          _includeResumeText(),
          _includeResumeSwitch(includeEducationProvider)
        ],
      );
    });
  }

  _includeResumeText() {
    return const Expanded(
        child: Text(
      constants.RESUME_SWITCH_LABEL,
      style: constants.STYLES.includedTextStyle,
    ));
  }

  _includeResumeSwitch(
      IncludeResumeForEducationProvider includeResumeProvider) {
    return Switch(
        // Styling the active and inactive switch colors.
        value: includeResumeProvider.includes,
        activeColor: constants.COLORS.darkBrown,
        trackColor: MaterialStateProperty.all(constants.COLORS.white),
        trackOutlineColor: MaterialStateProperty.resolveWith(
          (final Set<MaterialState> states) {
            if (states.contains(MaterialState.selected)) {
              return constants.COLORS.black;
            }

            return constants.COLORS.grey;
          },
        ),
        trackOutlineWidth: MaterialStateProperty.all(1),
        inactiveTrackColor: constants.COLORS.grey,
        onChanged: (value) {
          includeResumeProvider.includesEducation();
        });
  }
}

class AdditionalEducationInformation extends StatelessWidget {
  AdditionalEducationInformation({
    super.key,
  });

  // Controllers to track the input value keyed in by user.
  final schoolNameController = TextEditingController();
  final studyCourseController = TextEditingController();
  final graduateYearController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Consumer<IncludeResumeForEducationProvider>(
        builder: (context, includeResumeForEducationProvider, child) {
      return includeResumeForEducationProvider.includes
          ? Container()
          : Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Space adder
                WidgetSpacer(height: 10.0),
                _schoolNameLabel(),
                WidgetSpacer(height: 5.0),
                _schoolNameField(),
                WidgetSpacer(height: 15.0),
                _studyCourseLabel(),
                WidgetSpacer(height: 5.0),
                _studyCourseField(),
                WidgetSpacer(height: 15.0),
                _graduateYearLabel(),
                WidgetSpacer(height: 5.0),
                _graduateYearField()
              ],
            );
    });
  }

  _schoolNameLabel() {
    return const Text(
      constants.SCHOOL_NAME,
      style: constants.STYLES.jobApplicationInputLabel,
    );
  }

  _schoolNameField() {
    return TextFormField(
      controller: schoolNameController,
      textAlign: TextAlign.left,
      style: constants.STYLES.jobApplicationInputLabel,
      decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          contentPadding:
              const EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0)),
    );
  }

  _studyCourseLabel() {
    return const Text(
      constants.STUDY_COURSE,
      style: constants.STYLES.jobApplicationInputLabel,
    );
  }

  _studyCourseField() {
    return TextFormField(
      controller: studyCourseController,
      textAlign: TextAlign.left,
      style: constants.STYLES.jobApplicationInputLabel,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        contentPadding:
            const EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
      ),
    );
  }

  _graduateYearLabel() {
    return const Text(
      constants.GRADUATE_YEAR,
      style: constants.STYLES.jobApplicationInputLabel,
    );
  }

  _graduateYearField() {
    return TextFormField(
      controller: graduateYearController,
      textAlign: TextAlign.left,
      style: constants.STYLES.jobApplicationInputLabel,
      decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          contentPadding:
              const EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0)),
    );
  }
}

class RowToIncludeWork extends StatelessWidget {
  const RowToIncludeWork({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<IncludeResumeForWorkProvider>(
        builder: (context, includeResumeForWorkProvider, child) {
      return Row(
        children: [
          // Text and switch to include work experience in resume.
          _includeResumeLabel(),
          _includeResumeSwitch(includeResumeForWorkProvider)
        ],
      );
    });
  }

  _includeResumeLabel() {
    return const Expanded(
        child: Text(
      constants.RESUME_SWITCH_LABEL,
      style: constants.STYLES.includedTextStyle,
    ));
  }

  _includeResumeSwitch(
      IncludeResumeForWorkProvider includeResumeForWorkProvider) {
    return Switch(
        // Styling the active and inactive switch colors.
        value: includeResumeForWorkProvider.includes,
        activeColor: constants.COLORS.darkBrown,
        trackColor: MaterialStateProperty.all(constants.COLORS.white),
        trackOutlineColor: MaterialStateProperty.resolveWith(
          (final Set<MaterialState> states) {
            if (states.contains(MaterialState.selected)) {
              return constants.COLORS.black;
            }

            return constants.COLORS.grey;
          },
        ),
        trackOutlineWidth: MaterialStateProperty.all(1),
        inactiveTrackColor: constants.COLORS.grey,
        inactiveThumbColor: constants.COLORS.grey,
        onChanged: (value) {
          includeResumeForWorkProvider.includesWork(value);
        });
  }
}

class AdditionalWorkExperienceInformation extends StatelessWidget {
  AdditionalWorkExperienceInformation({super.key});

  final companyNameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Consumer<IncludeResumeForWorkProvider>(
        builder: (context, includeResumeForWorkProvider, child) {
      return includeResumeForWorkProvider.includes
          ? Container()
          : Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Space adder
                WidgetSpacer(height: 10.0),
                _companyNameLabel(),
                WidgetSpacer(height: 5.0),
                _companyNameField(),
              ],
            );
    });
  }

  _companyNameLabel() {
    return const Text(
      'Name of company',
      style: constants.STYLES.jobApplicationInputLabel,
    );
  }

  _companyNameField() {
    return TextFormField(
      controller: companyNameController,
      textAlign: TextAlign.left,
      style: constants.STYLES.jobApplicationInputLabel,
      decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          contentPadding:
              const EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0)),
    );
  }
}

class WidgetSearchBar extends StatefulWidget {
  const WidgetSearchBar({
    super.key,
  });

  @override
  State<StatefulWidget> createState() => _WidgetSearchBarState();
}

class _WidgetSearchBarState extends State<WidgetSearchBar> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: SearchAnchor(
          builder: (BuildContext context, SearchController controller) {
        return _searchBar(controller);
      }, suggestionsBuilder:
              (BuildContext context, SearchController controller) {
        return _searchBoxDisplay(controller);
      }),
    );
  }

  _searchBar(SearchController controller) {
    return SearchBar(
      controller: controller,
      padding: const MaterialStatePropertyAll<EdgeInsets>(
          EdgeInsets.symmetric(horizontal: 16.0)),
      onChanged: (_) {
        // No styling options were made for the controller below.
        controller.openView();
      },

      // Styling for the search box, icon and text.
      leading: const Icon(
        Icons.search,
        color: constants.COLORS.grey,
      ),
      hintText: 'Search for skills...',
      hintStyle: MaterialStateProperty.all(
          const TextStyle(color: constants.COLORS.black)),
      backgroundColor: MaterialStateProperty.all(constants.COLORS.white),
      elevation: MaterialStateProperty.all(0.0),
      shape: MaterialStateProperty.all(const ContinuousRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(20)),
          side: BorderSide(width: 1.0, color: constants.COLORS.black))),
      textStyle: MaterialStateProperty.all(
          const TextStyle(color: constants.COLORS.black)),
    );
  }

  // The below function is not linked with the additional skills, just for demo purposes.
  _searchBoxDisplay(SearchController controller) {
    return List<ListTile>.generate(5, (int index) {
      final String item = 'item $index';
      return ListTile(
        title: Text(item),
        onTap: () {
          setState(() {
            controller.closeView(item);
          });
        },
      );
    });
  }
}

class BottomButton extends StatelessWidget {
  const BottomButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.only(bottom: 30.0, left: 20.0, right: 20.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: SizedBox(
                height: 45,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const ReviewInfoPage()));
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: constants.COLORS.primary,
                      foregroundColor: constants.COLORS.white,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(7.0))),
                  child: const Text(
                    constants.PROCEED,
                    style: constants.STYLES.normalButtonWordStyle,
                  ),
                ),
              ),
            )
          ],
        ));
  }
}
