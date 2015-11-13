@HtmlImport('main_app.html')
library message_cipher.lib.main_app;

import 'dart:html';
import '../../model/global.dart';

import 'package:polymer_elements/iron_flex_layout/classes/iron_flex_layout.dart';
import 'package:polymer_elements/paper_header_panel.dart';
import 'package:polymer_elements/paper_toolbar.dart';
import 'package:polymer_elements/paper_material.dart';
import 'package:polymer_elements/paper_icon_button.dart';
import 'package:polymer/polymer.dart';
import 'package:web_components/web_components.dart' show HtmlImport;

// define the signature for the encode/decode functions
typedef int AlterCodeUnit(int codeUnit);

@PolymerRegister('main-app')
class MainApp extends PolymerElement {

  static const String IMAGE_PATH = "resources/images/";
  static const String ENCRYPT_ICON = "lock.svg";
  static const String DECRYPT_ICON = "unlock.svg";

  @Property(notify: true)
  String originalMessage = "";

  @Property(notify: true)
  String encryptedMessage = "";

  MainApp.created() : super.created();

  void ready() {
    log.info("$runtimeType::ready()");
  }

  // algorithm used to encode one character
  int encodeCodeUnit(int codeUnit) => codeUnit + 1;

  // algorithm used to decode one character
  int decodeCodeUnit(int codeUnit) => codeUnit - 1;

  String alter(String msg, {AlterCodeUnit operation}) =>
      new String.fromCharCodes(msg.codeUnits.map(operation));

  @reflectable
  void onEncrypt(Event event, Map detail) {
    log.info("$runtimeType::onEncrypt()");

    set('encryptedMessage', alter(originalMessage, operation: encodeCodeUnit));
  }

  @reflectable
  void onDecrypt(Event event, Map detail) {
    log.info("$runtimeType::onDecrypt()");

    set('originalMessage', alter(encryptedMessage, operation: decodeCodeUnit));
  }

  @reflectable
  bool disableButton(String msg) => msg.isEmpty;

  @property
  String get encryptIconPath => "$IMAGE_PATH$ENCRYPT_ICON";

  @property
  String get decryptIconPath => "$IMAGE_PATH$DECRYPT_ICON";
}