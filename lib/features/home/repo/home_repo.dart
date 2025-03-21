import 'package:quran_app/core/services/API/constants/api_endpoints.dart';
import 'package:quran_app/core/services/API/consumers/api_consumer.dart';
import 'package:quran_app/features/home/data/sec_api.dart';

class HomeRepo {
  final ApiConsumer _homeApi;

  HomeRepo(this._homeApi);

  Future<QuranData> getData() async {
    final response = await _homeApi.get(ApiEndpoints.baseUrl);
    QuranData welcome = QuranData.fromJson(response);
    return welcome;
  }
}
