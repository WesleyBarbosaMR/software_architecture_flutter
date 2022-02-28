import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:software_architecture_flutter/app/controllers/app_controller.dart';

// * Widget to request the AppController to modify the app's theme

class CustomSwitchWidget extends StatelessWidget {
  const CustomSwitchWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Switch(
      value: Modular.get<AppController>().isDark,
      onChanged: (bool value) {
        Modular.get<AppController>().changeThemeViewmodel.changeTheme(value);
      },
    );
  }
}
