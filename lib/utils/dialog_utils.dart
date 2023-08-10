import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:klasifikasi_gambar_blur_jernih/utils/position_utils.dart';

import '../components/text/text_component.dart';
import '../models/item_menu_dialog.dart';
import 'font_custom.dart';
import 'global_utils.dart';

Widget menuDialog(context, List<ItemMenuDialog> listMenu) {
  return SimpleDialog(
      title: const Text('Pilih Menu'),
      children: listMenu
          .map(
            (e) => SimpleDialogOption(
              onPressed: () {
                if (e.onPressed != null) e.onPressed!();
                dialogClose(context);
              },
              child: Text(e.title),
            ),
          )
          .toList());
}

Future<void> dialogShow({context, widget}) async {
  await showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return widget;
      });
}

showLoaderDialog() {
  AlertDialog alert = AlertDialog(
    content: Container(
      height: 100,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: 50,
            child: SpinKitWave(
              color: Colors.black,
              size: 50.0,
            ),
          ),
          V(16),
          Container(
              child: const TextComponent(
            "Loading...",
            size: 18,
            weight: FW.light,
          )),
        ],
      ),
    ),
  );
  showDialog(
    barrierDismissible: false,
    context: ctx,
    builder: (BuildContext context) {
      return alert;
    },
  );
}

closeLoaderDialog() {
  Navigator.of(ctx, rootNavigator: true).pop();
}

void dialogClose(context) {
  Navigator.of(context).pop();
}
