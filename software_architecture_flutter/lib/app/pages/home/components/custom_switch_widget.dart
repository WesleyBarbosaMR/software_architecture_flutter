import 'package:flutter/material.dart';
import 'package:software_architecture_flutter/app/controllers/app_controller.dart';

// * Widget to request the AppController to modify the app's theme

class CustomSwitchWidget extends StatelessWidget {
  const CustomSwitchWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Switch(
      value: AppController.instance.isDark,
      onChanged: (bool value) {
        AppController.instance.changeThemeViewmodel.changeTheme(value);
      },
    );
  }
}
