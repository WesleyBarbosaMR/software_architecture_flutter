import 'package:software_architecture_flutter/app/modules/home/models/apiAdvisor_model.dart';

abstract class IApiAdvisor {
  Future<ApiAdvisorModel?> getWeather();
}
