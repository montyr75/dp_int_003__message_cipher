library app_view;

import 'dart:html';
import 'package:polymer/polymer.dart';
import '../../model/global.dart';

// define the signature for the encode/decode functions
typedef int AlterCodeUnit(int codeUnit);

@CustomTag('app-view')
class AppView extends PolymerElement {

  // initialize system log
  bool _logInitialized = initLog();

  @observable String originalMessage = "";
  @observable String encryptedMessage = "";

  // non-visual initialization can be done here
  AppView.created() : super.created();

  // other initialization can be done here
  @override void attached() {
    super.attached();
    log.info("$runtimeType::attached()");
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
    log.info("$runtimeType::onEncrypt()");

    encryptedMessage = alter(originalMessage, operation: encodeCodeUnit);
  }

  void onDecrypt(Event event, var detail, Element target) {
    log.info("$runtimeType::onDecrypt()");

    originalMessage = alter(encryptedMessage, operation: decodeCodeUnit);
  }

  String alter(String msg, {AlterCodeUnit operation}) => new String.fromCharCodes(msg.codeUnits.map(operation));
}

