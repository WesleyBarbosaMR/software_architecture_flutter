import 'package:flutter/foundation.dart';

// * Class to modify app-wide view state

class AppController {
  // Creating a Singleton to modify app-wide view state
  static final AppController instance = AppController._();
  // Private constructor to modify state only through this instance
  AppController._();

  final themeSwitch = ValueNotifier<bool>(false);

  changeTheme(bool value) {
    themeSwitch.value = value;
  }
}
