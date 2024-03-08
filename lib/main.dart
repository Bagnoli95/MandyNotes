import 'package:flutter/material.dart';
import 'package:mandy_notes/pages/auth/login_page.dart';
import 'package:mandy_notes/pages/onboard/onboard_main.dart';
// import 'package:mandy_notes/pages/calendar/calendar_main.dart';

import 'pages/home/home_main.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: OnBoardingScreen(),
      // home: MyLoginPage(),
    );
  }
}
