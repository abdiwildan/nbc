import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddProductController extends GetxController {
  late TextEditingController sourceC;
  late TextEditingController incomeC;

  FirebaseFirestore firestore = FirebaseFirestore.instance;

  void addTransaction(String source, String income) async {
    CollectionReference transaction = firestore.collection("transaction");

    try {
      await transaction.add({
        "source": source,
        "income": income,
      });

      Get.defaultDialog(
          title: "Added",
          middleText: "Transaction has been added",
          onConfirm: () {
            sourceC.clear();
            incomeC.clear();
            Get.back();
            Get.back();
          });
    } catch (e) {
      Get.defaultDialog(
        title: "Not Added",
        middleText: "Transaction has been added",
      );
    }
  }

  @override
  void onInit() {
    sourceC = TextEditingController();
    incomeC = TextEditingController();
    super.onInit();
  }

  @override
  void onClose() {
    sourceC.dispose();
    incomeC.dispose();
    super.onClose();
  }
}
