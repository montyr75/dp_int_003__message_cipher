library main_view;

import 'dart:html';
import 'package:polymer/polymer.dart';

// define the signature for the encode/decode functions
typedef int AlterCodeUnit(int codeUnit);

@CustomTag('main-view')
class MainView extends PolymerElement {

  static const CLASS_NAME = "MainView";

  @observable String originalMessage = "";
  @observable String encryptedMessage = "";

  // non-visual initialization can be done here
  MainView.created() : super.created();

  // other initialization can be done here
  @override void attached() {
    super.attached();
    print("$CLASS_NAME::attached()");
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
    print("$CLASS_NAME::onEncrypt()");

    encryptedMessage = alter(originalMessage, operation: encodeCodeUnit);
  }

  void onDecrypt(Event event, var detail, Element target) {
    print("$CLASS_NAME::onDecrypt()");

    originalMessage = alter(encryptedMessage, operation: decodeCodeUnit);
  }

  String alter(String msg, {AlterCodeUnit operation}) => new String.fromCharCodes(msg.codeUnits.map(operation));
}

