import 'package:flutter/foundation.dart';
import 'package:software_architecture_flutter/app/services/shared_local_storage_service.dart';
import 'package:software_architecture_flutter/app/viewmodels/change_theme_viewmodel.dart';

class AppController {
  // * Create a controller to modify app-wide view state

  // * Creating a Singleton to ensure that a class has only one instance of itself
  // * and provides a single global point of access to it.
  static final AppController instance = AppController._();

  // * Private constructor to modify state only through this instance
  AppController._() {
    changeThemeViewmodel.init();
  }

  // * Using a View Model to consuming local storage
  // * through the interface to securely poll past changes
  final ChangeThemeViewmodel changeThemeViewmodel =
      ChangeThemeViewmodel(SharedLocalStorageService());

  bool get isDark => changeThemeViewmodel.config.themeSwitch.value;
  ValueNotifier<bool> get themeSwitch =>
      changeThemeViewmodel.config.themeSwitch;
}
