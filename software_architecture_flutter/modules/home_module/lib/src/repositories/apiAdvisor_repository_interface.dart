import 'package:home_module/src/models/apiAdvisor_model.dart';

abstract class IApiAdvisor {
  Future<ApiAdvisorModel?> getWeather();
}
