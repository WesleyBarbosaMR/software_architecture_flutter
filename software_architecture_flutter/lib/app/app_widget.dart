import 'package:core_module/core_module.dart' show ChangeThemeViewmodel;
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:home_module/home_module.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // * Listen singleton and modify app-wide view state
    return ValueListenableBuilder<bool>(
        // * Check the current instance of the AppController to build the screen
        valueListenable: Modular.get<ChangeThemeViewmodel>().config.themeSwitch,
        // * Building the screen according to the current instance of the AppController
        builder: (context, isDark, child) {
          return MaterialApp(
            title: 'Flutter Demo',
            debugShowCheckedModeBanner: false,
            // * Theme settings
            theme: ThemeData(
              primarySwatch: Colors.lime,
              visualDensity: VisualDensity.adaptivePlatformDensity,
              // * Checking changes in theme settings to display screen
              brightness: isDark ? Brightness.dark : Brightness.light,
            ),
            home: HomePage(),
          );
        });
  }
}
