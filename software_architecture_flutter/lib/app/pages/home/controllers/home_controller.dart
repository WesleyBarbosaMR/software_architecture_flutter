import 'package:flutter/foundation.dart';
import 'package:software_architecture_flutter/app/models/apiAdvisor_model.dart';
import 'package:software_architecture_flutter/app/viewmodels/apiAdvisor_viewmodel.dart';

class HomeController {
  final ApiAdvisorViewModel viewModel;

  HomeController(this.viewModel);

  ValueNotifier<ApiAdvisorModel?> get weather => viewModel.apiAdvisorModel;

  getWeather() {
    viewModel.fill();
  }
}
