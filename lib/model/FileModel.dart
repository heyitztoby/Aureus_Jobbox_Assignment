import 'dart:io';

/* file should be required, but since there's no file upload server, it is set as optional for this case */
class FileModel {
  int fileID = 0;
  String fileName = '';
  String dateUploaded = '';
  String fileType = '';
  File? file;

  FileModel(
      {required this.fileID,
      required this.fileName,
      required this.dateUploaded,
      required this.fileType,
      this.file});
}
