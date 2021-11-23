import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/core/shared_component/custom_theme.dart';
import 'package:movie_app/features/home/presentation/bloc/bloc.dart';
import 'package:movie_app/features/login/presentation/bloc/login_bloc.dart';
import 'package:movie_app/features/splash/presentation/pages/splashscreen.dart';
import 'package:movie_app/injection_container.dart' as di;
import 'package:movie_app/router.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  runApp(MultiBlocProvider(
    providers: [
      BlocProvider<LoginBloc>(create: (context) => di.sl<LoginBloc>()),
      BlocProvider<HomeBloc>(create: (context) => di.sl<HomeBloc>()),
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Movie App',
      routes: AppPages.pages,
      debugShowCheckedModeBanner: false,
      theme: MyTheme.lightTheme(context),
      home: const SplashScreen(),
    );
  }
}
