import 'package:software_architecture_flutter/app/models/apiAdvisor_model.dart';
import 'package:flutter/foundation.dart';
import 'package:software_architecture_flutter/app/repositories/apiAdvisor_repository_interface.dart';

class ApiAdvisorViewModel {
  final IApiAdvisor repository;

  final apiAdvisorModel = ValueNotifier<ApiAdvisorModel?>(null);

  ApiAdvisorViewModel(this.repository);

  fill() async {
    apiAdvisorModel.value = await repository.getWeather();
  }
}
