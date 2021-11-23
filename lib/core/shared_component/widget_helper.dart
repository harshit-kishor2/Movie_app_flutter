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
    color: ColorConst.GREY_COLOR,
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
  Color bgColor = ColorConst.APP_COLOR,
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
        txtColor: ColorConst.BLACK_COLOR,
        fontSize: fontSize,
        fontWeight: FontWeight.bold,
      ),
    ),
  );
}

//  {END TEXT VIEW}

// void showSnackBar(BuildContext context, String message) async {
//   try {
//     var snackbar = SnackBar(
//       content: getTxtWhiteColor(msg: message),
//       backgroundColor: ColorConst.GREEN_COLOR,
//       duration: const Duration(seconds: 3),
// //    action: SnackBarAction(
// //        label: "Undo",
// //        onPressed: () {
// //          logDubug(message + " undo");
// //        }),
//     );
//     Scaffold.of(context).hideCurrentSnackBar(reason: SnackBarClosedReason.hide);
//     await Scaffold.of(context).showSnackBar(snackbar);
//   } catch (e) {
//     print('object ' + e.toString());
//   }
// }

bool isDarkMode() {
  // ThemeModel.isDarkTheme;
  var brightness = SchedulerBinding.instance?.window.platformBrightness;
  final isDarkMode = brightness == Brightness.dark;
  // print("IS Dark Mode system : $isDarkMode \n app : ${ThemeModel.dark}");
  // ScopedModel.of<ThemeModel>(context).getTheme;
  return isDarkMode; //appDakMode;
}

// Color getColor(Color color) {
//   if (color == ColorConst.WHITE_COLOR)
//     return isDarkMode() ? ColorConst.BLACK_COLOR : ColorConst.WHITE_COLOR;
//   else if (color == ColorConst.BLACK_COLOR)
//     return isDarkMode() ? ColorConst.WHITE_COLOR : ColorConst.BLACK_COLOR;
//   else if (color == ColorConst.WHITE_BG_COLOR)
//     return isDarkMode() ? ColorConst.BLACK_BG_COLOR : ColorConst.WHITE_BG_COLOR;
//   else
//     return color;
// }