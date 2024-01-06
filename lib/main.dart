import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
//local
import 'package:nbc/screens/add_expense.dart';
import 'package:nbc/screens/add_income.dart';
import 'package:nbc/screens/edit_profile.dart';
import 'package:nbc/screens/login_screen.dart';
import 'package:nbc/screens/profile_screen.dart';
import 'package:nbc/screens/register_screen.dart';

import 'repository/authentication_repository.dart';
import 'screens/home_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform).then((value) => Get.put(AuthenticationRepository()));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'NBC App',
      initialRoute: '/',
      routes: {
        '/' :(context) => const LoginScreen(),
        '/home' :(context) => HomeScreen(),
        '/register' :(context) => const RegisterScreen(),
        '/edit' :(context) =>const EditProfile(),
        '/profile' :(context) => const ProfileScreen(), 
        '/addIncome' :(context) => const AddIncome(),
        '/addExpense' :(context) => const AddExpense()
      },
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        fontFamily: 'popping',
        textTheme: GoogleFonts.poppinsTextTheme(),
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.blue,
          elevation: 0,
        ),
        primarySwatch: Colors.blue,
      ),
    );
  }
}
