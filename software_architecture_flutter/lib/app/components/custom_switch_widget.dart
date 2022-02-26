import 'package:flutter/material.dart';
import 'package:software_architecture_flutter/app/controllers/app_controller.dart';

// * Widget to make AppController modify the app theme

class CustomSwitchWidget extends StatelessWidget {
  const CustomSwitchWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Switch(
      value: AppController.instance.themeSwitch.value,
      onChanged: (bool value) {
        AppController.instance.changeTheme(value);
      },
    );
  }
}
