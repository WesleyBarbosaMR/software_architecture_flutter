import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:home_module/src/controllers/home_controller.dart';
import 'package:home_module/src/home_page.dart';
import 'package:home_module/src/repositories/apiAdvisor_repository.dart';
import 'package:home_module/src/repositories/apiAdvisor_repository_interface.dart';
import 'package:home_module/src/viewmodels/apiAdvisor_viewmodel.dart';

class HomeModule extends Module {
  @override
  List<Bind> get binds {
    return [
      Bind((i) => HomeController(i.get())),
      Bind((i) => ApiAdvisorViewModel(i.get())),
      Bind<IApiAdvisor>((i) => ApiAdvisorRepository(i.get())),
    ];
  }

  @override
  Widget get bootstrap => HomePage();

  @override
  List<Router> get routers => [];
}
