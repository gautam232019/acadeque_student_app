import 'package:acadeque_student_app/modules/login/login_screen.dart';
import 'package:acadeque_student_app/modules/login/login_state.dart';
import 'package:acadeque_student_app/modules/register/register_screen.dart';
import 'package:acadeque_student_app/modules/register/register_state.dart';
import 'package:acadeque_student_app/modules/splash/splash_screen.dart';
import 'package:acadeque_student_app/modules/splash/splash_state.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:oktoast/oktoast.dart';
import 'package:provider/provider.dart';

void main() async {
  await GetStorage.init();
  runApp(const MyApp());
}

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return OKToast(
      child: MaterialApp(
        key: navigatorKey,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        routes: {
          '/login': (context) => ChangeNotifierProvider(
                create: (_) => LoginState(),
                child: const LoginScreen(),
              ),
          '/register': (context) => ChangeNotifierProvider(
                create: (_) => RegisterState(),
                child: const RegisterScreen(),
              ),
          '/splash': (context) => ChangeNotifierProvider(
                create: (_) => SplashState(),
                child: const SplashScreen(),
              ),
        },
        initialRoute: '/login',
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
