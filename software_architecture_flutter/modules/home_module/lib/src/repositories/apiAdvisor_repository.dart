import 'package:core_module/core_module.dart';
import 'package:home_module/src/models/apiAdvisor_model.dart';
import 'package:home_module/src/repositories/apiAdvisor_repository_interface.dart';

class ApiAdvisorRepository implements IApiAdvisor {
  final IClientHttp client;

  ApiAdvisorRepository(this.client);

  @override
  Future<ApiAdvisorModel> getWeather() async {
    var json = await client.get(
        "https://apiadvisor.climatempo.com.br/api/v1/anl/synoptic/locale/BR?token=f5cd801bdbfd1e853b93c62a822131e1");

    ApiAdvisorModel model = ApiAdvisorModel.fromJson(json[0]);
    return model;
  }
}
