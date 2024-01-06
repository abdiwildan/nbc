import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:get/get.dart';

class HomeController extends GetxController {
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future<QuerySnapshot<Object?>> getData() async {
    CollectionReference transaction = firestore.collection('transaction');

    return transaction.get();
  }

  Stream<QuerySnapshot<Object?>> streamData(){
    CollectionReference transaction = firestore.collection('transaction');
    return transaction.snapshots();
  }
}
