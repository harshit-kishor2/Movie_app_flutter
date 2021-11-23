import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

AppBar appbar(appbarClick) {
  return AppBar(
    backgroundColor: Colors.green,
    elevation: 0,
    leading: IconButton(
      padding: const EdgeInsets.only(left: 20.0),
      icon: SvgPicture.asset(
        "assets/icons/menu.svg",
        color: Colors.white,
      ),
      onPressed: appbarClick,
    ),
    actions: <Widget>[
      IconButton(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        icon: SvgPicture.asset(
          "assets/icons/search.svg",
          color: Colors.white,
        ),
        onPressed: () {},
      ),
    ],
  );
}
