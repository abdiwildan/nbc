import 'package:flutter/material.dart';
import 'package:nbc/screens/edit_profile.dart';

import 'package:nbc/screens/login_screen.dart';
import 'package:nbc/screens/profile_screen.dart';
import 'package:nbc/screens/register_screen.dart';

import 'screens/home_screen.dart';

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
        '/home' :(context) =>const HomeScreen(),
        '/register' :(context) => const RegisterScreen(),
        '/edit' :(context) =>const EditProfile(),
        '/profile' :(context) => ProfileScreen(), 
      },
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        fontFamily: "Poppins",
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.blue,
          elevation: 0,
        ),
        primarySwatch: Colors.blue,
      ),
    );
  }
}
