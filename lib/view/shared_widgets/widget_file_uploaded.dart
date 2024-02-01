import 'package:aureus_jobbox/provider/selected_file_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../constants.dart' as constants;
import '../../model/FileModel.dart';

class WidgetFileUploaded extends StatelessWidget {
  const WidgetFileUploaded({super.key, required this.file});
  final FileModel file;

  @override
  Widget build(BuildContext context) {
    // Variable to store the height of the device screen.
    double deviceHeight = MediaQuery.of(context).size.height;

    return Consumer<SelectedFileProvider>(
        builder: (context, selectedFileProvider, child) {
      return Container(
          // Ensure that the height for each item is 10% of the device screen's height.
          height: deviceHeight * 0.1,
          margin: const EdgeInsets.only(bottom: 5.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(7.0),
            color: constants.COLORS.primary,
          ),
          child: ElevatedButton(
            onPressed: () => {
              // Setting the file type to be resume or cover letter.
              file.fileType == 'Resume'
                  ? selectedFileProvider.setSelectedResume(file)
                  : selectedFileProvider.setSelectedCoverLetter(file)
            },
            style: ElevatedButton.styleFrom(
                // Conditional check to change background color of selected resume/cover letter
                backgroundColor: (selectedFileProvider.resume.fileID ==
                            file.fileID ||
                        selectedFileProvider.coverLetter.fileID == file.fileID)
                    ? constants.COLORS.primary
                    : constants.COLORS.primaryLight3,
                foregroundColor: (selectedFileProvider.resume.fileID ==
                            file.fileID ||
                        selectedFileProvider.coverLetter.fileID == file.fileID)
                    ? constants.COLORS.white
                    : constants.COLORS.primary,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(7.0))),
            child: Row(
              children: [
                Container(
                    margin: const EdgeInsets.only(right: 20.0),
                    child: const Icon(
                      Icons.edit_document,
                      size: 30.0,
                    )),
                Expanded(
                    child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(file.fileName,
                        style: TextStyle(
                          fontFamily: constants.FONTFAMILY.Poppins,
                          fontWeight: constants.POPPINS.semibold,
                          // Conditional check to change font color of selected resume/cover letter
                          color: (selectedFileProvider.resume.fileID ==
                                      file.fileID ||
                                  selectedFileProvider.coverLetter.fileID ==
                                      file.fileID)
                              ? constants.COLORS.white
                              : constants.COLORS.primary,
                          fontSize: constants.FONTS.med,
                        )),
                    Text(file.dateUploaded,
                        style: TextStyle(
                          fontFamily: constants.FONTFAMILY.Poppins,
                          fontWeight: constants.POPPINS.regular,
                          // Conditional check to change font color of selected resume/cover letter
                          color: (selectedFileProvider.resume.fileID ==
                                      file.fileID ||
                                  selectedFileProvider.coverLetter.fileID ==
                                      file.fileID)
                              ? constants.COLORS.white
                              : constants.COLORS.primary,
                          fontSize: constants.FONTS.xs,
                        )),
                  ],
                ))
              ],
            ),
          ));
    });
  }
}
