import 'package:quran_app/core/services/API/constants/api_endpoints.dart';
import 'package:quran_app/core/services/API/consumers/api_consumer.dart';

class HomeRepo {
  final ApiConsumer _homeApi;

  HomeRepo(this._homeApi);

  Future getHomeData() async {
    var response = await _homeApi.get(ApiEndpoints.suwar);
    return response;
  }
}
