import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:software_architecture_flutter/app/modules/home/controllers/home_controller.dart';
import 'package:software_architecture_flutter/app/modules/home/home_page.dart';
import 'package:software_architecture_flutter/app/modules/home/repositories/apiAdvisor_repository.dart';
import 'package:software_architecture_flutter/app/modules/home/repositories/apiAdvisor_repository_interface.dart';
import 'package:software_architecture_flutter/app/modules/home/viewmodels/apiAdvisor_viewmodel.dart';

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
