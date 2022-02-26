import 'package:flutter/foundation.dart';
import 'package:software_architecture_flutter/app/interfaces/local_storage_interface.dart';
import 'package:software_architecture_flutter/app/models/appConfig_model.dart';
import 'package:software_architecture_flutter/app/services/shared_local_storage_service.dart';

// * Class to modify app-wide view state

class AppController {
  // Creating a Singleton to modify app-wide view state
  static final AppController instance = AppController._();
  // Private constructor to modify state only through this instance
  AppController._() {
    storage.get('isDark').then((value) {
      if (value != null) {
        config.themeSwitch.value = value;
      }
    });
  }

  // Get view model
  final AppConfigModel config = AppConfigModel();
  bool get isDark => config.themeSwitch.value;
  ValueNotifier<bool> get themeSwitch => config.themeSwitch;

  // Consuming local storage
  final ILocalStorage storage = SharedLocalStorageService();

  // State manage
  changeTheme(bool value) {
    config.themeSwitch.value = value;
    storage.put('isDark', value);
  }
}
