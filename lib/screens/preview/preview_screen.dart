import 'dart:io';

import 'package:flutter/material.dart';
import 'package:klasifikasi_gambar_blur_jernih/utils/screen_utils.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

import '../../components/text/text_component.dart';
import '../../utils/font_custom.dart';
import '../../utils/position_utils.dart';
import 'logic.dart';

class PreviewScreen extends StatefulWidget {
  final File? image;
  final double persenBlur;
  final double persenJernih;
  final String pred;
  const PreviewScreen(
      {super.key,
      this.image,
      required this.persenBlur,
      required this.persenJernih,
      required this.pred});

  @override
  State<PreviewScreen> createState() => _PreviewScreenState();
}

class _PreviewScreenState extends State<PreviewScreen> {
  final l = Logic();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 50),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextComponent(
                "menu",
                size: 18,
                weight: FW.light,
              ),
              V(8),
              TextComponent("Preview"),
              V(48),
              Column(
                children: [
                  // Container(width: 0.8.w, child: Image.asset("assets/images/bg_splash.png")),
                  V(24),
                  widget.image == null
                      ? Text('No image selected.')
                      : Container(
                          padding: EdgeInsets.all(8),
                          width: 1.0.w,
                          height: 0.45.h,
                          color: Colors.grey,
                          child: Image.file(
                            File(widget.image!.path),
                          ),
                        ),
                  V(16),
                  TextComponent(
                    widget.pred,
                    size: 18,
                  ),
                  V(16),
                  LinearPercentIndicator(
                    width: 0.6.w,
                    animation: true,
                    lineHeight: 30.0,
                    animationDuration: 2000,
                    percent: widget.persenJernih / 100,
                    animateFromLastPercent: true,
                    center: Text("${widget.persenJernih.toStringAsFixed(2)}%"),
                    leading: Text("Jernih"),
                    // isRTL: true,
                    barRadius: Radius.elliptical(5, 15),
                    progressColor: Colors.greenAccent,
                    maskFilter: MaskFilter.blur(BlurStyle.solid, 3),
                  ),

                  V(16),

                  LinearPercentIndicator(
                    width: 0.6.w,
                    animation: true,
                    lineHeight: 30.0,
                    animationDuration: 2000,
                    percent: widget.persenBlur / 100,
                    animateFromLastPercent: true,
                    center: Text("${widget.persenBlur.toStringAsFixed(2)}%"),
                    leading: Text("Blur    "),
                    // isRTL: true,
                    barRadius: Radius.elliptical(5, 15),
                    progressColor: Colors.redAccent,
                    maskFilter: MaskFilter.blur(BlurStyle.solid, 3),
                  ),

                  V(0.2.w),

                  // ButtonElevatedComponent(
                  //   "Kembali",
                  //   onPressed: () {
                  //     l.onPickGallery(setState);
                  //   },
                  //   w: 0.5.w,
                  // )
                ],
              )
            ],
          ),
        ));
  }
}
