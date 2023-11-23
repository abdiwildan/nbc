import 'package:flutter/material.dart';
import 'package:nbc/screens/base_scren.dart';
import 'package:nbc/screens/login_screen.dart';
import 'package:nbc/screens/register_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'NBC App',
      initialRoute: '/',
      routes: {
        '/' :(context) => const LoginScreen(),
        '/home' :(context) =>BaseScreen(),
        '/register' :(context) => const RegisterScreen() 
      },
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        fontFamily: "Poppins",
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.white,
          elevation: 0,
        ),
        primarySwatch: Colors.blue,
      ),
    );
  }
}
