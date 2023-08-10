import 'package:flutter/material.dart';

class GlobalContext { 
  static GlobalKey<NavigatorState> navigatorKey = 
  GlobalKey<NavigatorState>();
}

BuildContext ctx = GlobalContext.navigatorKey.currentContext!;