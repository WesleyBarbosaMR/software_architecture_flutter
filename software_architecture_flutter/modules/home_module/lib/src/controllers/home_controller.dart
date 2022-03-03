import 'package:flutter/foundation.dart';
import 'package:home_module/src/models/apiAdvisor_model.dart';
import 'package:home_module/src/viewmodels/apiAdvisor_viewmodel.dart';

class HomeController {
  final ApiAdvisorViewModel viewModel;

  HomeController(this.viewModel);

  ValueNotifier<ApiAdvisorModel?> get weather => viewModel.apiAdvisorModel;

  getWeather() {
    viewModel.fill();
  }
}
