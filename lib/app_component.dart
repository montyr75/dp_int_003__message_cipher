import 'package:angular/angular.dart';
import 'package:angular_components/angular_components.dart';
import 'package:angular_forms/angular_forms.dart';

import 'src/cipher.dart';

// AngularDart info: https://webdev.dartlang.org/angular
// Components info: https://webdev.dartlang.org/components

@Component(
  selector: 'my-app',
  styleUrls: ['app_component.css', 'package:angular_components/app_layout/layout.scss.css'],
  templateUrl: 'app_component.html',
  directives: [
    coreDirectives,
    formDirectives,
    MaterialButtonComponent
  ],
)
class AppComponent {
  String originalMessage;
  String encryptedMessage;

  AppComponent() {
    print("$runtimeType()");
  }

  void onEncrypt() {
    print("$runtimeType::onEncrypt()");

    encryptedMessage = alter(originalMessage, operation: encodeCodeUnit);
    originalMessage = null;
  }

  void onDecrypt() {
    print("$runtimeType::onDecrypt()");

    originalMessage = alter(encryptedMessage, operation: decodeCodeUnit);
    encryptedMessage = null;
  }
}
