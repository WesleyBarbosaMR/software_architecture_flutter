import 'package:core_module/src/interfaces/local_storage_interface.dart';
import 'package:core_module/src/models/appConfig_model.dart';

class ChangeThemeViewmodel {
  // * Access local storage through a constructor
  // Prevent errors in case of future changes in the way data is stored
  final ILocalStorage storage;
  ChangeThemeViewmodel(this.storage);

  // * Get the model and its theme definitions
  final AppConfigModel config = AppConfigModel();

  Future init() async {
    // * Check if storage contains view change
    await storage.get('isDark').then((value) {
      // If contains previous change
      if (value != null) {
        // Modify app-wide view state
        config.themeSwitch.value = value;
      }
      // If not contains previous change, remains the default theme
    });
  }

  // * Managing app view state
  changeTheme(bool value) {
    config.themeSwitch.value = value;
    storage.put('isDark', value);
  }
}
