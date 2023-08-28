import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart';
import 'package:klasifikasi_gambar_blur_jernih/screens/preview/preview_screen.dart';
import 'package:klasifikasi_gambar_blur_jernih/utils/pick_file_utils.dart';

import '../../utils/constant.dart';
import '../../utils/dialog_utils.dart';
import '../../utils/navigate_utils.dart';

class Logic {
  File? file;

  Future<void> _uploadImage(image) async {
    showLoaderDialog();

    var request = MultipartRequest(
      'POST',
      Uri.parse("$BASE_URL/upload"),
    );
    Map<String, String> headers = {"Content-type": "multipart/form-data"};
    request.files.add(
      MultipartFile(
        'image',
        image.readAsBytes().asStream(),
        image.lengthSync(),
        filename: "image.jpg",
      ),
    );
    request.headers.addAll(headers);
    var response = await request.send();
    if (response.statusCode == 200) {
      final resPredict = await get(Uri.parse("$BASE_URL/predict"));
      final data = jsonDecode(resPredict.body);
      print(data);
      final skor = data["skor"];
      final pred = data["predict"];
      double persenBlur = 0.0;
      double persenJernih = 0.0;
      if (skor <= 0.5) {
        persenBlur = percentBlur(skor);
        persenJernih = 100.0 - persenBlur;
      } else {
        persenJernih = percentJernih(skor);
        persenBlur = 100.0 - persenJernih;
      }
      print(persenBlur);
      print(persenJernih);
      closeLoaderDialog();
      navigatePush(PreviewScreen(
          image: image, persenBlur: persenBlur, persenJernih: persenJernih, pred: pred));
    } else {
      print('Image upload failed');
      closeLoaderDialog();
    }
  }

  double percentBlur(double value) {
    double minRange = 0.0;
    double maxRange = 0.5;

    double percentage = 100.0 - ((value - minRange) / (maxRange - minRange)) * 100.0;
    return percentage;
  }

  double percentJernih(double value) {
    double minRange = 0.5;
    double maxRange = 1.0;

    double percentage = ((value - minRange) / (maxRange - minRange)) * 100.0;
    return percentage;
  }

  Future<void> onPickCamera(setState) async {
    final image = await pickCamera();

    if (image != null) {
      _uploadImage(image);
    }

    // setState(() {
    //   file = image;
    // });
  }

  Future<void> onPickGallery(setState) async {
    final image = await pickImage();

    if (image != null) {
      _uploadImage(image);
    }

    // setState(() {
    //   file = image;
    // });
  }
}
