import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_modular_test/flutter_modular_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:software_architecture_flutter/app/app_module.dart';
import 'package:software_architecture_flutter/app/interfaces/client_http_interface.dart';
import 'package:software_architecture_flutter/app/models/apiAdvisor_model.dart';
import 'package:software_architecture_flutter/app/repositories/apiAdvisor_repository.dart';
import 'package:software_architecture_flutter/app/services/client_http_service.dart';
import 'package:software_architecture_flutter/app/viewmodels/apiAdvisor_viewmodel.dart';

class ClientHttpMockito extends Mock implements IClientHttp {}

main() {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences.setMockInitialValues({});

  initModule(AppModule(), replaceBinds: [
    Bind<IClientHttp>((i) => ClientHttpMockito()),
  ]);
  /*
  final mock = ClientHttpMockito();

  final viewModel = ApiAdvisorViewModel(
    ApiAdvisorRepository(
      mock,
    ),
  );
  */
  group("ApiAdvisorViewModel", () {
    test('ApiAdvisorViewModel error', () async {
      when(
        Modular.get<IClientHttp>().get(
            "https://apiadvisor.climatempo.com.br/api/v1/anl/synoptic/locale/BR?token=f5cd801bdbfd1e853b93c62a822131e1"),
      ).thenThrow(Exception("error"));
      final viewModel = Modular.get<ApiAdvisorViewModel>();
      await viewModel.fill();
      expect(viewModel.apiAdvisorModel.value, null);
    });

    test('ApiAdvisorViewModel success', () async {
      when(
        Modular.get<IClientHttp>().get(
            "https://apiadvisor.climatempo.com.br/api/v1/anl/synoptic/locale/BR?token=f5cd801bdbfd1e853b93c62a822131e1"),
      ).thenAnswer(
        (_) => Future.value([
          ApiAdvisorModel(
            country: "BR",
            date: "2022-02-27",
            text:
                "Uma frente fria permanece semi-estacionária entre MG e BA, deixando o tempo chuvoso nestas áreas.",
          ).toJson(),
        ]),
      );
      final viewModel = Modular.get<ApiAdvisorViewModel>();
      await viewModel.fill();
      expect(viewModel.apiAdvisorModel.value, isA<ApiAdvisorModel>());
    });
  });
}
