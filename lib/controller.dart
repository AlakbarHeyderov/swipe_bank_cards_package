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

  void createAnimationWidgets() {
    for (var i = 0; i < list.length; i++) {
      myInitialCount++;
      myAnimationSelectedBool.add(false);
      myAnimationisRightBool.add(false);
      myStack.add(AnimatedCardsWidget(
        index: i,
        sag: myAnimationisRightBool[i],
        selected: myAnimationSelectedBool[i],
        topPosition: 0 + ((i + 1) * 20),
        cardColor: list[i]['color'],
        name: list[i]['name'],
        cardNumber: list[i]['number'],
        cardType: list[i]['cardType'],
        date: list[i]['date'],
      ));
    }
  }

  @override
  void onInit() {
    createAnimationWidgets();
    super.onInit();
  }
}
