import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:software_architecture_flutter/app/modules/home/models/apiAdvisor_model.dart';
import 'package:software_architecture_flutter/app/modules/home/controllers/home_controller.dart';
import 'package:software_architecture_flutter/app/modules/home/repositories/apiAdvisor_repository.dart';
import 'package:software_architecture_flutter/app/core/services/client_http_service.dart';
import 'package:software_architecture_flutter/app/modules/home/viewmodels/apiAdvisor_viewmodel.dart';
import 'package:test_api/test_api.dart';
import 'package:http/http.dart';

import 'package:flutter/material.dart';
import 'package:software_architecture_flutter/app/modules/home/components/custom_switch_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final controller = Modular.get<HomeController>();

  @override
  Widget build(BuildContext context) {
    return /*SingleChildScrollView(
      // * Used to avoid app rendering errors on phones with small screens.
      //padding: EdgeInsets.all(8.0),
      child:*/
        Scaffold(
      appBar: AppBar(
        title: Text('Home Page'),
      ),
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.wb_sunny_rounded),
          onPressed: () {
            controller.getWeather();
          }),
      body: Center(
        child: Column(
          children: [
            CustomSwitchWidget(),
            ValueListenableBuilder<ApiAdvisorModel?>(
                valueListenable: controller.weather,
                builder: (context, model, child) {
                  if (model?.text == null) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  return Text(model.toString());
                })
          ],
        ),
      ),
      //),
    );
  }
}
