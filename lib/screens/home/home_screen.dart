import 'package:flutter/material.dart';
import 'package:klasifikasi_gambar_blur_jernih/utils/screen_utils.dart';

import '../../components/button/button_component.dart';
import '../../components/text/text_component.dart';
import '../../utils/font_custom.dart';
import '../../utils/position_utils.dart';
import 'logic.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
              TextComponent("Dashboard"),
              V(48),
              Column(
                children: [
                  Container(width: 0.8.w, child: Image.asset("assets/images/bg_splash.png")),
                  V(68),
                  ButtonElevatedComponent(
                    "Kamera",
                    onPressed: () {
                      l.onPickCamera(setState);
                    },
                    w: 0.6.w,
                  ),
                  V(16),
                  ButtonElevatedComponent(
                    "Gallery",
                    onPressed: () {
                      l.onPickGallery(setState);
                    },
                    w: 0.6.w,
                  )
                ],
              )
            ],
          ),
        ));
  }
}
