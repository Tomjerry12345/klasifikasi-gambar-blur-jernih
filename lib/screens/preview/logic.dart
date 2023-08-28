import 'dart:io';

import 'package:klasifikasi_gambar_blur_jernih/utils/pick_file_utils.dart';

class Logic {
  File? file;

  Future<void> onPickCamera(setState) async {
    final image = await pickCamera();

    setState(() {
      file = image;
    });
  }

  Future<void> onPickGallery(setState) async {
    final image = await pickImage();

    setState(() {
      file = image;
    });
  }
}
