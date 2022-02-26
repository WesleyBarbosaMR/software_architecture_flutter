import 'package:flutter/material.dart';
import 'package:software_architecture_flutter/app/controllers/app_controller.dart';
import 'package:software_architecture_flutter/app/pages/home/home_page.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // * Listen singleton and modify app-wide view state
    return ValueListenableBuilder<bool>(
        valueListenable: AppController.instance.themeSwitch,
        builder: (context, isDark, child) {
          return MaterialApp(
            title: 'Flutter Demo',
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              primarySwatch: Colors.lime,
              visualDensity: VisualDensity.adaptivePlatformDensity,
              brightness: isDark ? Brightness.dark : Brightness.light,
            ),
            home: HomePage(),
          );
        });
  }
}
