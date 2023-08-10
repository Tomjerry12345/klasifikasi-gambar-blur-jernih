import 'package:flutter/material.dart';

import 'global_utils.dart';

navigatePush(page, {isRemove = false}) {
  if (isRemove) {
    return Navigator.pushAndRemoveUntil(
        ctx, MaterialPageRoute(builder: (context) => page), (Route route) => false);
  } else {
    return Navigator.push(
      ctx,
      MaterialPageRoute(builder: (context) => page),
    );
  }
}

navigatePop({data}) {
  Navigator.pop(ctx, data);
}
