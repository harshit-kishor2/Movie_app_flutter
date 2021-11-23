import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:movie_app/core/constant/color_constants.dart';
import 'package:movie_app/core/shared_component/custom_text.dart';
import 'package:movie_app/core/util/slide_route.dart';

void navigationPush(BuildContext context, StatefulWidget route) {
  Navigator.push(context, RouteTransition(widget: route));
}

void navigationPushReplacement(BuildContext context, Widget route) {
  Navigator.pushReplacement(context, RouteTransition(widget: route));
}

void navigationPushReplacementsss(BuildContext context, String name) {
  Navigator.pushReplacementNamed(context, name);
}

void navigationPop(BuildContext context, StatefulWidget route) {
  Navigator.pop(context, RouteTransition(widget: route));
}

void navigationStateLessPush(BuildContext context, StatelessWidget route) {
  Navigator.push(context, MaterialPageRoute(builder: (context) {
    return route;
  }));
}

void navigationStateLessPop(BuildContext context, StatelessWidget route) {
  Navigator.pop(context, MaterialPageRoute(builder: (context) {
    return route;
  }));
}

void delay({
  required BuildContext context,
  int duration = 3,
  required String route,
}) {
  Future.delayed(
    Duration(seconds: duration),
    () {
      navigationPushReplacementsss(context, route);
    },
  );
}

Divider getDivider({
  double height = 10,
}) {
  return Divider(
    color: ColorConst.greyColor,
    height: height,
  );
}

SizedBox getSizeBox({
  double height = 15,
}) {
  return SizedBox(
    height: height,
  );
}
//  {END PAGE NAVIGATION}

AppBar getAppBarWithBackBtn({
  String title = '',
  Color bgColor = ColorConst.appColor,
  double fontSize = 15,
  String titleTag = '',
  Widget? icon,
  List<Widget>? actions,
}) {
  return AppBar(
    backgroundColor: bgColor,
    leading: icon,
    actions: actions,
    centerTitle: true,
    title: Hero(
      tag: titleTag,
      child: getTxtColor(
        msg: title,
        txtColor: ColorConst.blackColor,
        fontSize: fontSize,
        fontWeight: FontWeight.bold,
      ),
    ),
  );
}

//  {END TEXT VIEW}

bool isDarkMode() {
  // ThemeModel.isDarkTheme;
  var brightness = SchedulerBinding.instance?.window.platformBrightness;
  final isDarkMode = brightness == Brightness.dark;
  return isDarkMode; //appDakMode;
}
