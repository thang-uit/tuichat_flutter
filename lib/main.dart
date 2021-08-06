import 'package:flutter/material.dart';
import 'package:tuichat_flutter/theme.dart';
import 'package:tuichat_flutter/screens/welcome/welcome_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TuiChat',
      debugShowCheckedModeBanner: false,
      theme: lightThemeData(context),
      darkTheme: darkThemeData(context),
      // themeMode: ThemeMode.system, // Default theme mode by phone
      home: WelcomeScreen(),
    );
  }
}
