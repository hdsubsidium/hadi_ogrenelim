import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'app/constant.dart';
import 'app/splash_screen.dart';

void main() {
  
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]).then(
    (_) => runApp(const MyApp()),
  );
  
    runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'proje2',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: kBackgroundColor,
        fontFamily: "CabinSketch",
        textTheme: const TextTheme(
          bodyLarge: TextStyle(color: kBodyTextColor),
        ),
      ),
           home: const SplashScreen(),
    );
  }
}
