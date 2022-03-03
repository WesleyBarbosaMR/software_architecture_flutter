import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:core_module/core_module.dart' show ChangeThemeViewmodel;

// * Widget to request the AppController to modify the app's theme

class CustomSwitchWidget extends StatelessWidget {
  const CustomSwitchWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable: Modular.get<ChangeThemeViewmodel>().config.themeSwitch,
        builder: (context, isDark, child) {
          return Switch(
            value: Modular.get<ChangeThemeViewmodel>().config.themeSwitch ==
                isDark,
            onChanged: Modular.get<ChangeThemeViewmodel>().changeTheme,
            /*
            value: Modular.get<AppController>().isDark,
            onChanged: (bool value) {
              Modular.get<AppController>()
                  .changeThemeViewmodel
                  .changeTheme(value);
            },
            */
          );
        });
  }
}
