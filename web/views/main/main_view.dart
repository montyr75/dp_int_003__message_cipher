library main_view;

import 'dart:html';
import 'package:polymer/polymer.dart';

@CustomTag('main-view')
class MainView extends PolymerElement {

  @observable String originalMessage = "";
  @observable String encryptedMessage = "";

  // non-visual initialization can be done here
  MainView.created() : super.created();

  // other initialization can be done here
  @override void enteredView() {
    super.enteredView();
    print("MainView::enteredView()");
  }

  // algorithm used to encode one character
  int encodeCodeUnit(int codeUnit) {
    return codeUnit + 1;
  }

  // algorithm used to decode one character
  int decodeCodeUnit(int codeUnit) {
    return codeUnit - 1;
  }

  void onEncrypt(Event event, var detail, Element target) {
    print("MainView::onEncrypt()");

    encryptedMessage = alter(originalMessage, operation: encodeCodeUnit);
  }

  void onDecrypt(Event event, var detail, Element target) {
    print("MainView::onDecrypt()");

    originalMessage = alter(encryptedMessage, operation: decodeCodeUnit);
  }

  String alter(String msg, {Function operation}) => new String.fromCharCodes(msg.codeUnits.map(operation));

  // this lets the global CSS bleed through into the Shadow DOM of this element
  bool get applyAuthorStyles => true;
}

