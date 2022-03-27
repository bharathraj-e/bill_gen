import 'package:flutter/cupertino.dart';

abstract class SizeConst {
  static const double maxMobileWidth = 420.0;

  static bool isSmallScreen(BuildContext context) {
    // dPrint(MediaQuery.of(context).size.width);
    return MediaQuery.of(context).size.width < maxMobileWidth;
  }
}
