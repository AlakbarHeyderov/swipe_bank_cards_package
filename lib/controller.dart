import 'package:get/get.dart';
import 'package:swipe_bank_cards/swipe_bank_cards.dart';

class MyAnimateionController extends GetxController {
  MyAnimateionController({
    required this.list,
  });
  var list = [];
  var myStack = [].obs;
  var myAnimationSelectedBool = [].obs;
  var myAnimationisRightBool = [].obs;
  var myInitialCount = 0.obs;
  var rightToLeft = true.obs;

  void createAnimationWidgets() {
    for (var i = 0; i < list.length; i++) {
      myInitialCount++;
      myAnimationSelectedBool.add(false);
      myAnimationisRightBool.add(false);
      if (list.length >= 6) {
        if (i == 0 || i == 1 || i == 2) {
          myStack.add(AnimatedCardsWidget(
            index: i,
            sag: myAnimationisRightBool[i],
            selected: myAnimationSelectedBool[i],
            topPosition: 0,
            cardColor: list[i]['color'],
            name: list[i]['name'],
            cardNumber: list[i]['number'],
            cardType: list[i]['cardType'],
            date: list[i]['date'],
          ));
        } else {
          myStack.add(AnimatedCardsWidget(
            index: i,
            sag: myAnimationisRightBool[i],
            selected: myAnimationSelectedBool[i],
            topPosition: 0 + (i * 10),
            cardColor: list[i]['color'],
            name: list[i]['name'],
            cardNumber: list[i]['number'],
            cardType: list[i]['cardType'],
            date: list[i]['date'],
          ));
        }
      } else if (list.length >= 5) {
        if (i == 0 || i == 1) {
          myStack.add(AnimatedCardsWidget(
            index: i,
            sag: myAnimationisRightBool[i],
            selected: myAnimationSelectedBool[i],
            topPosition: 0,
            cardColor: list[i]['color'],
            name: list[i]['name'],
            cardNumber: list[i]['number'],
            cardType: list[i]['cardType'],
            date: list[i]['date'],
          ));
        } else {
          myStack.add(AnimatedCardsWidget(
            index: i,
            sag: myAnimationisRightBool[i],
            selected: myAnimationSelectedBool[i],
            topPosition: (i + 1) * 10,
            cardColor: list[i]['color'],
            name: list[i]['name'],
            cardNumber: list[i]['number'],
            cardType: list[i]['cardType'],
            date: list[i]['date'],
          ));
        }
      } else if (list.length >= 4) {
        if (i == 0) {
          myStack.add(AnimatedCardsWidget(
            index: i,
            sag: myAnimationisRightBool[i],
            selected: myAnimationSelectedBool[i],
            topPosition: 0,
            cardColor: list[i]['color'],
            name: list[i]['name'],
            cardNumber: list[i]['number'],
            cardType: list[i]['cardType'],
            date: list[i]['date'],
          ));
        } else {
          myStack.add(AnimatedCardsWidget(
            index: i,
            sag: myAnimationisRightBool[i],
            selected: myAnimationSelectedBool[i],
            topPosition: ((i + 1) * 10),
            cardColor: list[i]['color'],
            name: list[i]['name'],
            cardNumber: list[i]['number'],
            cardType: list[i]['cardType'],
            date: list[i]['date'],
          ));
        }
      } else {
        myStack.add(AnimatedCardsWidget(
          index: i,
          sag: myAnimationisRightBool[i],
          selected: myAnimationSelectedBool[i],
          topPosition: (i + 1) * 10,
          cardColor: list[i]['color'],
          name: list[i]['name'],
          cardNumber: list[i]['number'],
          cardType: list[i]['cardType'],
          date: list[i]['date'],
        ));
      }
    }
  }

  @override
  void onInit() {
    createAnimationWidgets();
    super.onInit();
  }
}
