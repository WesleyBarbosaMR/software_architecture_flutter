import 'package:software_architecture_flutter/app/modules/home/models/apiAdvisor_model.dart';
import 'package:flutter/foundation.dart';
import 'package:software_architecture_flutter/app/modules/home/repositories/apiAdvisor_repository_interface.dart';

class ApiAdvisorViewModel {
  final IApiAdvisor repository;

  final apiAdvisorModel = ValueNotifier<ApiAdvisorModel?>(null);

  ApiAdvisorViewModel(this.repository);

  fill() async {
    try {
      apiAdvisorModel.value = await repository.getWeather();
    } catch (e) {}
  }
}
