import 'package:aureus_jobbox/provider/selected_file_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../constants.dart' as constants;

class WidgetFileSelected extends StatelessWidget {
  const WidgetFileSelected({super.key, required this.fileType});
  final String fileType;

  @override
  Widget build(BuildContext context) {
    double deviceHeight = MediaQuery.of(context).size.height;

    return Consumer<SelectedFileProvider>(
        builder: (context, selectedFileProvider, child) {
      // Variable to store the conditional check for no selected resume/cover letter.
      bool noSelectedFile =
          selectedFileProvider.resume.fileName.compareTo('') == 0 ||
              selectedFileProvider.coverLetter.fileName.compareTo('') == 0;
      return SizedBox(
        // Ensure the height of each entry is 6% of device screen's height.
        height: noSelectedFile ? 0 : deviceHeight * 0.06,
        child: (Row(
          children: [
            Container(
                margin: const EdgeInsets.only(right: 20.0),
                child: noSelectedFile
                    ? Container()
                    : const Icon(
                        Icons.edit_document,
                        size: 35.0,
                      )),
            Expanded(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                  Text(
                    // Conditional check to display the file name of the respective file type.
                    fileType == 'Resume'
                        ? selectedFileProvider.resume.fileName
                        : selectedFileProvider.coverLetter.fileName,
                    style: constants.STYLES.jdLabelStyle,
                  ),
                  Text(
                    // Conditional check to display the date uploaded of the respective file type.
                    fileType == 'Resume'
                        ? selectedFileProvider.resume.dateUploaded
                        : selectedFileProvider.coverLetter.dateUploaded,
                    style: constants.STYLES.smallDarkTextStyle,
                  )
                ]))
          ],
        )),
      );
    });
  }
}
