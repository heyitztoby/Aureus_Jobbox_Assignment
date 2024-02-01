import 'package:aureus_jobbox/model/FileModel.dart';
import 'package:aureus_jobbox/model/JobListingModel.dart';
import 'package:aureus_jobbox/provider/file_upload.provider.dart';
import 'package:aureus_jobbox/provider/selected_job_listing_provider.dart';
import 'package:aureus_jobbox/view/application/main_employment_info.dart';
import 'package:aureus_jobbox/view/shared_widgets/widget_file_uploaded.dart';
import 'package:aureus_jobbox/view/shared_widgets/widget_linear_progressbar.dart';
import 'package:aureus_jobbox/view/shared_widgets/widget_spacer.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../constants.dart' as constants;

class DocumentUploadingPage extends StatelessWidget {
  const DocumentUploadingPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Variable to retrieve the selected job.
    JobListingModel selectedJobListing =
        context.read<SelectedJobListingProvider>().selectedListing;

    // Variable to retrieve the list of files uploaded.
    List<FileModel> fileList = context.read<FileUploadProvider>().files;

    // Variable to store the height of device screen.
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
          body: SingleChildScrollView(
              child: UploadedDocuments(fileList: fileList)),
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
        _crossButton(context),
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

  _crossButton(BuildContext context) {
    return IconButton(
      padding: const EdgeInsets.only(right: 10.0),
      icon: const Icon(
        Icons.close,
        color: constants.COLORS.black,
      ),
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
        constants.UPLOADING_DOCS,
        style: constants.STYLES.progressBarText,
      ),
    );
  }

  _jobApplicationProgressBar() {
    return Container(
      margin: const EdgeInsets.only(left: 5.0, right: 5.0),
      // Displaying 30% done for the progress bar.
      child: const WidgetLinearProgressBar(determinateValue: 0.3),
    );
  }
}

class UploadedDocuments extends StatelessWidget {
  const UploadedDocuments({
    super.key,
    required this.fileList,
  });

  final List<FileModel> fileList;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10.0, left: 20.0, right: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Row that defines the resume category.
          _resumeCategoryLabel(),
          // Space adder
          WidgetSpacer(height: 20.0),
          // List of resumes uploaded.
          _resumesUploaded(),

          // Row that defines the cover letter category.
          _coverLetterCategoryLabel(),
          WidgetSpacer(height: 20.0),

          // List of cover letters uploaded.
          _coverLettersUploaded(),
        ],
      ),
    );
  }

  _resumeCategoryLabel() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Space adder
            WidgetSpacer(
              height: 10.0,
            ),
            _resumeLabel(),
            _resumeDescription(),
          ],
        ),
        _addButton(),
      ],
    );
  }

  _resumeLabel() {
    return const Text(
      constants.RESUME_LABEL,
      style: constants.STYLES.jobApplicationLabel,
    );
  }

  _resumeDescription() {
    return const Text(
      constants.RESUME_DESC,
      softWrap: true,
      style: constants.STYLES.jobApplicationDescText,
    );
  }

  _addButton() {
    return Container(
        margin: const EdgeInsets.only(top: 10.0),
        child: IconButton(
          onPressed: () => {},
          icon: const Icon(Icons.add),
          iconSize: 40.0,
        ));
  }

  _resumesUploaded() {
    return ListView.builder(
        scrollDirection: Axis.vertical,
        itemCount: fileList.length,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          // Only return files that are resumes.
          if (fileList[index].fileType == 'Resume') {
            return WidgetFileUploaded(
              file: fileList[index],
            );
          } else {
            return Container();
          }
        });
  }

  _coverLetterCategoryLabel() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            WidgetSpacer(
              height: 10.0,
            ),
            const Text(
              constants.COVER_LETTER_LABEL,
              style: constants.STYLES.jobApplicationLabel,
            ),
            const Text(
              constants.COVER_LETTER_DESC,
              style: constants.STYLES.jobApplicationDescText,
            ),
          ],
        ),
        Container(
            margin: const EdgeInsets.only(top: 10.0),
            child: IconButton(
              onPressed: () => {},
              icon: const Icon(Icons.add),
              iconSize: 40.0,
            )),
      ],
    );
  }

  _coverLettersUploaded() {
    return ListView.builder(
        scrollDirection: Axis.vertical,
        itemCount: fileList.length,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          // Only return files that are cover letters.
          if (fileList[index].fileType == 'Cover Letter') {
            return WidgetFileUploaded(
              file: fileList[index],
            );
          } else {
            return Container();
          }
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
                            builder: (context) => const EmploymentInfoPage()));
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
