/*
 * Project Name:  StoryLingoKids
 * File Name:     main.dart
 * File Function: 应用程序入口
 * Author:        林继申
 * Update Date:   2024-06-08
 * License:       MIT License
 */

import 'package:flutter/material.dart'
    show
        BuildContext,
        Color,
        MaterialApp,
        StatelessWidget,
        TextStyle,
        TextTheme,
        ThemeData,
        Widget,
        WidgetsFlutterBinding,
        runApp;
import 'package:flutter/services.dart'
    show Color, DeviceOrientation, SystemChrome;
import 'package:storylingokids/app/views/startup_view.dart' show SplashScreen;

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]).then(
    (_) => runApp(const MyApp()),
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'StoryLingoKids',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: const Color(0xFFFEFEFE),
        fontFamily: 'CabinSketch',
        textTheme: const TextTheme(
          bodyLarge: TextStyle(color: Color(0xFF4B4B4B)),
        ),
      ),
      home: const SplashScreen(),
    );
  }
}
