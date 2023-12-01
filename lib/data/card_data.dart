import 'package:flutter/material.dart';
import 'package:nbc/constants/color_constants.dart';

class CardModel {
  String income;
  String expense;
  Color cardColor;

  CardModel({
    required this.income,
    required this.expense,
    required this.cardColor,
  });
}

List<CardModel> myCards = [
  CardModel(
    income: "RP. 100.000.000",
    expense: "Rp. 500.000",
    cardColor: kPrimaryColor,
  ),
];
