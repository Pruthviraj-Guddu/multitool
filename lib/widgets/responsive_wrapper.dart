import 'package:flutter/material.dart';
import 'package:multitool/responsive/app_screen_util.dart';

class ResponsiveWrapper extends StatelessWidget {
  final Widget child;

  const ResponsiveWrapper({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return OrientationBuilder(
          builder: (context, orientation) {
            // Initialize before building any widgets
            AppScreenUtil.init(constraints, orientation);
            return child;
          },
        );
      },
    );
  }
}
