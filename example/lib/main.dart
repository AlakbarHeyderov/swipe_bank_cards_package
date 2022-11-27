// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace, must_be_immutable, prefer_const_constructors_in_immutables, library_private_types_in_public_api, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:swipe_bank_cards/swipe_bank_cards.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SafeArea(
          child: Column(
            children: [
              Container(
                  width: double.infinity,
                  // height: 300,
                  child: MyAnimationWidget(
                    list: testData,
                  )),
            ],
          ),
        ),
      ),
    );
  }
}

List<Map> testData = [
  {
    "name": "Alakbar",
    "surname": "Heydarov",
    "cardType": "Master",
    "date": "12/23",
    "number": "1234 **** **** 0101",
    "color": 0xFFffca05
  },
  {
    "name": "Balasef",
    "surname": "Aliyev",
    "cardType": "Visa",
    "date": "12/23",
    "number": "1234 **** **** 0101",
    "color": 0xFF378916
  },
  {
    "name": "Seymur",
    "surname": "Memmedhuseynov",
    "cardType": "Master",
    "date": "12/23",
    "number": "1234 **** **** 0101",
    "color": 0xFFd45459
  },
];
