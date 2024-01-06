import 'package:flutter/material.dart';
import 'package:nbc/constants/app_textstyle.dart';
import 'package:nbc/models/card_data.dart';

class MyCard extends StatelessWidget {
  final CardModel card;
  const MyCard({ super.key, required this.card });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      height: 200,
      width: 350,
      decoration: BoxDecoration(
        color: card.cardColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "CARD NAME",
                    style: ApptextStyle.MY_CARD_TITLE,
                  ),
                  Text(
                    card.income,
                    style: ApptextStyle.MY_CARD_SUBTITLE,
                  ),
                ],
              ),
              Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "EXP DATE",
                        style: ApptextStyle.MY_CARD_TITLE,
                      ),
                      Text(
                        card.expense,
                        style: ApptextStyle.MY_CARD_SUBTITLE,
                      ),
                    ],
                  ),
                  const SizedBox(width: 20),
                ],
              )
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: 50,
                height: 50,
                child: Image.asset('assets/icons/mcard.png'),
              ),
            ],
          )
        ],
      ),
    );
  }
}
