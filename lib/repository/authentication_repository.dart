import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

import '../screens/home_screen.dart';
import '../screens/login_screen.dart';
import 'authefication_repository/exceptions/regist_email_password_failure.dart';

class AuthenticationRepository extends GetxController {
  static AuthenticationRepository get instance => Get.find();

  final _auth = FirebaseAuth.instance;
  late final Rx<User?> firebaseUser;

  get currentUser => null;

  @override
  void onReady() {
    firebaseUser = Rx<User?>(_auth.currentUser);
    firebaseUser.bindStream(_auth.userChanges());
    ever(firebaseUser, _setInitialScreen);
  }

  _setInitialScreen(User? user) {
    user == null
        ? Get.offAll(() => const LoginScreen())
        : Get.offAll(() =>  HomeScreen());
  }

  Future<void> createUserWithEmailAndPassword(
      String email, String password) async {
    try {
      await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      firebaseUser.value != null
          ? Get.offAll(() =>  HomeScreen())
          : Get.snackbar('Error', 'Something went wrong.');
    } on FirebaseAuthException catch (e) {
      final ex = RegisterWithEmailAndPasswordFailure.code(e.code);
      Get.snackbar('Notification', ex.message);
    }
  }

  Future<void> signInWithEmailAndPassword(String email, String password) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      firebaseUser.value != null
          ? Get.offAll(() => HomeScreen())
          : Get.snackbar('Error', 'Something went wrong.');
    } on FirebaseAuthException catch (e) {
      Get.snackbar('Error', e.message ?? 'Something went wrong.');
    }
  }

  Future<void> signOut() async {
    await _auth.signOut();
    update();
    Get.offAll(() => const LoginScreen());
  }
}


 // Future<void> createUserWithEmailAndPassword(
  //     String email, String password) async {
  //   try {
  //     await _auth.createUserWithEmailAndPassword(
  //         email: email, password: password);
  //     firebaseUser.value != null
  //         ? Get.offAll(() => BaseScreen.routeName)
  //         : Get.offAll(() => LoginScreen.routeName);
  //   } on FirebaseAuthException catch (e) {
  //     final ex = RegisterWithEmailAndPasswordFailure.code(e.code);
  //     print('FIREBASE AUTH EXCEPTION - ${ex.message}');
  //     throw ex;
  //   } catch (_) {
  //     const ex = RegisterWithEmailAndPasswordFailure();
  //     print('FIREBASE AUTH EXCEPTION - ${ex.message}');
  //     throw ex;
  //   }
  // }