import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:movie_app/core/constant/constant.dart';

AppBar appbar(appbarClick) {
  return AppBar(
    backgroundColor: ColorConst.appColor,
    elevation: 0,
    leading: IconButton(
      padding: const EdgeInsets.only(left: 20.0),
      icon: SvgPicture.asset(
        AssetsConst.menuIcon,
        color: ColorConst.whiteColor,
      ),
      onPressed: appbarClick,
    ),
    actions: <Widget>[
      IconButton(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        icon: SvgPicture.asset(
          AssetsConst.searchIcon,
          color: ColorConst.whiteColor,
        ),
        onPressed: () {},
      ),
    ],
  );
}
