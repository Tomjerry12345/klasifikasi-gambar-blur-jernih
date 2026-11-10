A Flutter mobile app that tells you whether a photo is blurry or sharp. Take a photo or pick one from the gallery, and the app sends it to a classification server and shows the result as blur and sharp percentages.

## Model

The classifier is a MobileNet-based model (transfer learning: frozen ImageNet weights with a small dense head) trained in Google Colab: [open the training notebook](https://colab.research.google.com/drive/1JypyFDlNPSFKdzhNCC8HI3aDmGawkkoS). It reached 87% accuracy on the validation split of 201 images, with precision and recall between 0.83 and 0.91 for both classes. The dataset came from a client and is not included, and the server that exposed the model to the app is not part of this repository.

## Features

- Take a photo with the camera or pick an image from the gallery
- Upload the image to a classification server over HTTP
- Show the predicted label with two percentage bars: sharp ("Jernih") and blur
- Loading dialog while the image is being processed

## How it works

1. The user picks an image (camera or gallery) with `image_picker`.
2. The app uploads it with a multipart `POST /upload` request (field name `image`).
3. When the upload succeeds, the app calls `GET /predict`, which returns the prediction as JSON.
4. The app converts the returned score into blur and sharp percentages and shows them on the preview screen next to the image.

## Tech stack

- Flutter (Dart SDK `>=3.0.1 <4.0.0`)
- [`image_picker`](https://pub.dev/packages/image_picker) for camera and gallery access
- [`http`](https://pub.dev/packages/http) for the upload and prediction requests
- [`percent_indicator`](https://pub.dev/packages/percent_indicator) for the result bars

See `pubspec.yaml` for the full dependency list.

## Server API

The classification model runs on a separate server that is not part of this repository. The app expects these endpoints:

| Method | Endpoint   | Description                                                                 |
| ------ | ---------- | --------------------------------------------------------------------------- |
| `POST` | `/upload`  | `multipart/form-data` with the image in the `image` field. Returns HTTP 200 |
| `GET`  | `/predict` | Returns JSON with `predict` (label) and `skor` (score between 0 and 1)      |

`/predict` is called right after `/upload` and is expected to return the result for the image that was just uploaded.

## Getting started

**Requirements:** Flutter SDK 3.x, an Android device or emulator, and a running classification server.

```bash
git clone https://github.com/Tomjerry12345/klasifikasi-gambar-blur-jernih.git
cd klasifikasi-gambar-blur-jernih
flutter pub get
```

Set the server address in `lib/utils/constant.dart`:

```dart
final BASE_URL = "http://<your-server-ip>:5000";
```

Then run the app:

```bash
flutter run
```

If the server runs on your computer, the phone and the computer must be on the same network.

## Project structure

```
lib/
├── main.dart                 # App entry point
├── screens/
│   ├── home/                 # Dashboard: camera and gallery buttons, upload logic
│   └── preview/              # Result screen: image, label and percentage bars
├── components/               # Reusable UI widgets (buttons, text, text fields)
└── utils/                    # Server URL, image picking, dialogs, navigation helpers
```

## Notes

- `BASE_URL` points to a local network address by default. Change it to your own server.
- The app uses plain HTTP. For a release build, add the `INTERNET` permission to `android/app/src/main/AndroidManifest.xml` (it is currently only declared for debug and profile builds), and allow cleartext traffic if your server does not use HTTPS.
