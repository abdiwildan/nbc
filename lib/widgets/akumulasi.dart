import 'package:flutter/material.dart';
import 'package:nbc/constants/app_textstyle.dart';
import 'package:nbc/models/card_data.dart';

class Akumulasi extends StatelessWidget {
  final CardModel card;
  const Akumulasi({super.key, required this.card});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      height: 150,
      width: 350,
      decoration: BoxDecoration(
        color: card.cardColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Pendapatan",
                    style: ApptextStyle.MY_CARD_TITLE,
                  ),
                  Text(
                    card.income,
                    style: ApptextStyle.MY_CARD_SUBTITLE,
                  ),
                ],
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Pengeluaran",
                style: ApptextStyle.MY_CARD_TITLE,
              ),
              Text(
                card.expense,
                style: ApptextStyle.MY_CARD_SUBTITLE,
              ),
            ],
          )
        ],
      ),
    );
  }
}
