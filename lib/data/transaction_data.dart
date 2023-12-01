import 'package:flutter/material.dart';

class TransactionModel {
  String name;
  String avatar;
  String currentBalance;
  String month;
  String changePercentageIndicator;
  String changePercentage;
  Color color;

  TransactionModel({
    required this.avatar,
    required this.changePercentage,
    required this.changePercentageIndicator,
    required this.currentBalance,
    required this.month,
    required this.name,
    required this.color,
  });
}

List<TransactionModel> myTransactions = [
  TransactionModel(
    avatar: "assets/icons/avatar1.png",
    currentBalance: "Rp. 2.000.000",
    changePercentage: "0.41%",
    changePercentageIndicator: "up",
    month: "Jan",
    name: "Uang Jajan",
    color: Colors.white,
  ),
  TransactionModel(
    avatar: "assets/icons/avatar2.png",
    currentBalance: "Rp. 30.000",
    changePercentageIndicator: "down",
    changePercentage: "4.54%",
    month: "Mar",
    name: "Makan Warteg",
    color: Colors.orange,
  ),
  TransactionModel(
    avatar: "assets/icons/avatar3.png",
    currentBalance: "Rp. 4052",
    changePercentage: "1.27%",
    changePercentageIndicator: "down",
    month: "Mar",
    name: "Patungan K",
    color: Colors.red,
  ),
  TransactionModel(
    avatar: "assets/icons/avatar4.png",
    currentBalance: "Rp. 1.000.000",
    changePercentageIndicator: "up",
    changePercentage: "3.09%",
    month: "Mar",
    name: "Bit Coin",
    color: Colors.deepPurple,
  ),
  TransactionModel(
    avatar: "assets/icons/avatar1.png",
    currentBalance: "Rp. 250.000",
    changePercentage: "0.41%",
    changePercentageIndicator: "up",
    month: "Jan",
    name: "Free Lancee",
    color: Colors.green,
  ),
  TransactionModel(
    avatar: "assets/icons/avatar2.png",
    currentBalance: "Rp. 2.500.0",
    changePercentageIndicator: "down",
    changePercentage: "4.54%",
    month: "Mar",
    name: "Sepatu Jordan",
    color: Colors.orange,
  ),
];
