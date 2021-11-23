import 'package:flutter/material.dart';
import 'package:movie_app/core/shared_component/widget_helper.dart';
import 'package:movie_app/core/util/global_utility.dart';
import 'package:movie_app/core/util/shared_preference.dart';
import 'package:movie_app/features/splash/presentation/widgets/splash_component.dart';
import 'package:movie_app/injection_container.dart';
import 'package:movie_app/router.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final SharedPreferenceModule sharedPreferences = sl.get();
  @override
  void initState() {
    super.initState();
    Future.delayed(
      const Duration(seconds: 3),
      () {
        getUser();
      },
    );
  }

  getUser() async {
    var u = sharedPreferences.getUserData();
    printWarning('USER $u');
    if (u.isNotEmpty) {
      navigationPushReplacementsss(context, Routes.MOVIES);
    } else {
      navigationPushReplacementsss(context, Routes.LOGIN);
    }
  }

  @override
  Widget build(BuildContext context) {
    return const SplashComponent();
  }
}
