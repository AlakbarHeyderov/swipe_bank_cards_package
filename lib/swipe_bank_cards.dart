// ignore_for_file: must_be_immutable

library swipe_bank_cards;

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:swipe_bank_cards/controller.dart';

// MyAnimateionController _myAnimateionController =
//     Get.put(MyAnimateionController(list: []));

class MyAnimationWidget extends StatefulWidget {
  List list;
  bool rigtToLeft;

  MyAnimationWidget({this.rigtToLeft = true, required this.list, Key? key})
      : super(key: key);

  @override
  State<MyAnimationWidget> createState() => _MyAnimationWidgetState();
}

class _MyAnimationWidgetState extends State<MyAnimationWidget> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<MyAnimateionController>(
        init: Get.put(MyAnimateionController(list: widget.list)),
        builder: (controller) {
          controller.rightToLeft.value = widget.rigtToLeft;
          return Container(
            height: 260,
            child: Obx(() => Stack(children: [
                  ...controller.myStack,
                ])),
          );
        });
  }
}

class AnimatedCardsWidget extends StatefulWidget {
  bool selected;
  bool sag;
  double topPosition;
  int index;
  String cardNumber;
  String name;
  String date;
  String cardType;
  int cardColor;

  AnimatedCardsWidget(
      {required this.selected,
      required this.sag,
      required this.topPosition,
      required this.index,
      required this.cardNumber,
      required this.cardType,
      required this.date,
      required this.name,
      required this.cardColor,
      Key? key})
      : super(key: key);

  @override
  _AnimatedCardsWidgetState createState() => _AnimatedCardsWidgetState();
}

class _AnimatedCardsWidgetState extends State<AnimatedCardsWidget> {
  MyAnimateionController _myAnimateionController = Get.find();
  @override
  Widget build(BuildContext context) {
    return AnimatedPositioned(
      height: 200.0,
      top: widget.topPosition,
      left: _myAnimateionController.myAnimationSelectedBool[widget.index]
          ? _myAnimateionController.rightToLeft.value
              ? -500
              : 500
          : 20.0,
      right: _myAnimateionController.myAnimationSelectedBool[widget.index]
          ? _myAnimateionController.rightToLeft.value
              ? 500
              : -500
          : 20,
      duration: const Duration(milliseconds: 700),
      curve: Curves.fastOutSlowIn,
      child: GestureDetector(
        onPanUpdate: (details) {
          _myAnimateionController.myAnimationisRightBool[widget.index] =
              _myAnimateionController.rightToLeft.value
                  ? details.delta.dx < 0
                      ? false
                      : true
                  : details.delta.dx < 0
                      ? true
                      : false;
        },
        onPanEnd: (details) {
          // Left => Right
          if (_myAnimateionController.myAnimationisRightBool[widget.index] &&
              widget.index !=
                  _myAnimateionController.myAnimationisRightBool.length - 1) {
            _myAnimateionController.myInitialCount.value++;
            setState(() {
              _myAnimateionController
                      .myAnimationSelectedBool[widget.index + 1] =
                  !_myAnimateionController
                      .myAnimationSelectedBool[widget.index + 1];

              _myAnimateionController.myAnimationisRightBool[widget.index + 1] =
                  !_myAnimateionController
                      .myAnimationisRightBool[widget.index + 1];
              _myAnimateionController.myStack[widget.index + 1] =
                  AnimatedCardsWidget(
                      index: widget.index + 1,
                      sag: false,
                      selected: false,
                      cardNumber: _myAnimateionController.list[widget.index + 1]
                          ['number'],
                      name: _myAnimateionController.list[widget.index + 1]
                          ['name'],
                      cardType: _myAnimateionController.list[widget.index + 1]
                          ['cardType'],
                      date: _myAnimateionController.list[widget.index + 1]
                          ['date'],
                      topPosition: 0 + ((widget.index + 2) * 10),
                      cardColor: _myAnimateionController.list[widget.index + 1]
                          ['color']);
            });
          }

          // Left <= Righrt

          if (!_myAnimateionController.myAnimationisRightBool[widget.index] &&
              widget.index != 0) {
            if (widget.index ==
                _myAnimateionController.myInitialCount.value - 1) {
              _myAnimateionController.myInitialCount.value--;
              setState(() {
                _myAnimateionController.myAnimationSelectedBool[widget.index] =
                    !_myAnimateionController
                        .myAnimationSelectedBool[widget.index];
              });
            }
          }
        },
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: Color(widget.cardColor),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 5,
                blurRadius: 7,
                offset: Offset(0, 3),
              ),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.only(
                top: 8.0, bottom: 8.0, left: 20, right: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(),
                Text(widget.cardNumber),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(widget.name),
                    Text(widget.date),
                    Text(widget.cardType),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
