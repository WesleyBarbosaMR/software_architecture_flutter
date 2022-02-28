import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:software_architecture_flutter/app/interfaces/client_http_interface.dart';
import 'package:software_architecture_flutter/app/models/apiAdvisor_model.dart';
import 'package:software_architecture_flutter/app/repositories/apiAdvisor_repository.dart';
import 'package:software_architecture_flutter/app/services/client_http_service.dart';
import 'package:software_architecture_flutter/app/viewmodels/apiAdvisor_viewmodel.dart';

class ClientHttpMock implements IClientHttp {
  @override
  void addToken(String token) {}

  @override
  Future get(String url) async {
    return [
      ApiAdvisorModel(
        country: "BR",
        date: "2022-02-27",
        text:
            "Uma frente fria permanece semi-estacionária entre MG e BA, deixando o tempo chuvoso nestas áreas.",
      ).toJson(),
    ];
  }
}

class ClientHttpErrorMock implements IClientHttp {
  @override
  void addToken(String token) {}

  @override
  Future get(String url) async {
    return [];
  }
}

class ClientHttpMockito extends Mock implements IClientHttp {}

main() {
  final mock = ClientHttpMockito();

  final viewModel = ApiAdvisorViewModel(
    ApiAdvisorRepository(
      mock,
    ),
  );

  group("ApiAdvisorViewModel", () {
    test('ApiAdvisorViewModel error', () async {
      when(
        mock.get(
            "https://apiadvisor.climatempo.com.br/api/v1/anl/synoptic/locale/BR?token=f5cd801bdbfd1e853b93c62a822131e1"),
      ).thenThrow(Exception("error"));

      await viewModel.fill();
      expect(viewModel.apiAdvisorModel.value, null);
    });

    test('ApiAdvisorViewModel success', () async {
      when(
        mock.get(
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
      await viewModel.fill();
      expect(viewModel.apiAdvisorModel.value, isA<ApiAdvisorModel>());
    });
  });
}
