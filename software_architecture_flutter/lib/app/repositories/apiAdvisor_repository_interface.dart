import 'package:software_architecture_flutter/app/models/apiAdvisor_model.dart';

abstract class IApiAdvisor {
  Future<ApiAdvisorModel?> getWeather();
}
