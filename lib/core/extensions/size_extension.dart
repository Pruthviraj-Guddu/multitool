import 'package:flutter/material.dart';
import 'package:multitool/responsive/app_screen_util.dart';
extension SizeExtension on num {
  double get widthMultiplier {
    assert(AppScreenUtil.screenWidth > 0, 'AppScreenUtil not initialized');
    return (this * AppScreenUtil.screenWidth) / 360; // 360 is design width
  }

  double get heightMultiplier {
    assert(AppScreenUtil.screenHeight > 0, 'AppScreenUtil not initialized');
    return (this * AppScreenUtil.screenHeight) / 800; // 800 is design height
  }

  SizedBox get toVerticalSizedBox => SizedBox(height: toDouble());
  SizedBox get toHorizontalSizedBox => SizedBox(width: toDouble());
}