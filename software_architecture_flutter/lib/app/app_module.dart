import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:software_architecture_flutter/app/app_widget.dart';
import 'package:software_architecture_flutter/app/controllers/app_controller.dart';
import 'package:software_architecture_flutter/app/core/interfaces/client_http_interface.dart';
import 'package:software_architecture_flutter/app/core/interfaces/local_storage_interface.dart';
import 'package:software_architecture_flutter/app/modules/home/controllers/home_controller.dart';
import 'package:software_architecture_flutter/app/modules/home/repositories/apiAdvisor_repository.dart';
import 'package:software_architecture_flutter/app/modules/home/repositories/apiAdvisor_repository_interface.dart';
import 'package:software_architecture_flutter/app/core/services/client_http_service.dart';
import 'package:software_architecture_flutter/app/core/services/shared_local_storage_service.dart';
import 'package:software_architecture_flutter/app/modules/home/viewmodels/apiAdvisor_viewmodel.dart';
import 'package:software_architecture_flutter/app/core/viewmodels/change_theme_viewmodel.dart';

class AppModule extends Module {
  @override
  List<Bind> get binds {
    return [
      Bind<IClientHttp>((i) => ClientHttpService()),
      Bind((i) => AppController(i.get()), isLazy: false),
      Bind((i) => ChangeThemeViewmodel(i.get())),
      Bind<ILocalStorage>((i) => SharedLocalStorageService()),
    ];
  }

  @override
  Widget get bootstrap => AppWidget();

  @override
  List<Router> get routers => [];
}
