import 'package:home_module/src/models/apiAdvisor_model.dart';
import 'package:home_module/src/repositories/apiAdvisor_repository_interface.dart';
import 'package:flutter/foundation.dart';

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
