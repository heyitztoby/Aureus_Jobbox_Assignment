import 'package:aureus_jobbox/model/FileModel.dart';
import 'package:flutter/material.dart';

class SelectedFileProvider extends ChangeNotifier {
  FileModel _resume =
      FileModel(fileID: 0, fileName: '', dateUploaded: '', fileType: 'Resume');
  FileModel _coverLetter = FileModel(
      fileID: 0, fileName: '', dateUploaded: '', fileType: 'Cover Letter');

  FileModel get resume => _resume;
  FileModel get coverLetter => _coverLetter;

  void setSelectedResume(FileModel file) {
    _resume = file;
    notifyListeners();
  }

  void setSelectedCoverLetter(FileModel file) {
    _coverLetter = file;
    notifyListeners();
  }
}
