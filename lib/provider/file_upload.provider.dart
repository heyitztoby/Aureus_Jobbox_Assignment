import 'package:aureus_jobbox/model/FileModel.dart';
import 'package:aureus_jobbox/sample_data/resumes_cover_letters.dart';
import 'package:flutter/foundation.dart';

class FileUploadProvider with ChangeNotifier {
  // Pushing in sample resume and cover letter for demo purposes, as no server is set up.
  final List<FileModel> _files = [
    SampleResumeCoverLetter().resume,
    SampleResumeCoverLetter().coverLetter1,
    SampleResumeCoverLetter().coverLetter2,
  ];

  List<FileModel> get files => _files;

  void uploadFile(FileModel file) {
    _files.add(file);
    notifyListeners();
  }
}
