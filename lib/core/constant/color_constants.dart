import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/core/util/global_utility.dart';
import 'package:movie_app/core/shared_component/widget_helper.dart';

class ColorConst {
  // "Start"

  static Color blackColor = isDarkMode() ? Colors.white : Colors.black;
  static Color whiteColor = isDarkMode() ? Colors.black : Colors.white;
  static Color whiteBgColor =
      isDarkMode() ? Colors.grey.shade800 : Colors.white;

  static const Color appColor = Colors.green;
  static const Color blackBgColor = Colors.black54;
  static const Color greyColor = Colors.grey;
  static Color grey800 = Colors.grey.shade800;

//! Color from hex
  static Color fcmAppColor = colorFromHex("#fbae44");
  static Color fbColor = colorFromHex("#2951a6");

  //End
}
