import 'package:quran_app/core/services/API/constants/api_endpoints.dart';
import 'package:quran_app/core/services/API/consumers/api_consumer.dart';
import 'package:quran_app/features/home/data/suwar_model.dart';

class HomeRepo {
  final ApiConsumer _homeApi;

  HomeRepo(this._homeApi);

  Future<List<SuwarModel>> getHomeData() async {
    Map<String, dynamic> response = await _homeApi.get(ApiEndpoints.suwar);
    List<SuwarModel> suwar =
        (response['suwar'] as List).map((e) => SuwarModel.fromJson(e)).toList();
    return suwar;
  }
}
