import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'app/constants.dart';
import 'app/views/startupView.dart';

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
      title: 'StoryLingoKids',
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
