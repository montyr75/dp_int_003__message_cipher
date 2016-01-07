library message_cipher.web.index;

import 'package:polymer_elements/iron_flex_layout/classes/iron_flex_layout.dart';
import 'package:polymer/polymer.dart';

import 'package:message_cipher/views/main_app/main_app.dart';
import 'package:message_cipher/services/logger.dart' as Logger;

const String APP_NAME = "message_cipher";

main() async {
  Logger.log = Logger.initLog(APP_NAME);
  await initPolymer();
}
