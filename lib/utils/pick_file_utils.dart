import 'dart:io';

import 'package:image_picker/image_picker.dart';

final _picker = ImagePicker();

Future<File?> pickImage() async {
  final pickedFile = await _picker.pickImage(source: ImageSource.gallery);

  if (pickedFile == null) return null;

  File image = File(pickedFile.path);

  return image;
}

Future<File?> pickVideo() async {
  final pickedFile = await _picker.pickVideo(source: ImageSource.gallery);

  if (pickedFile == null) return null;

  File video = File(pickedFile.path);

  return video;
}

String getNameFile(File file) {
  Uri uri = Uri.parse(file.path);
  String fileName = uri.pathSegments.last;
  return fileName;
}
