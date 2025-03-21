import 'dart:developer';

import 'package:quran_app/core/services/API/constants/api_endpoints.dart';
import 'package:quran_app/core/services/API/constants/data_keys.dart';
import 'package:quran_app/core/services/API/consumers/api_consumer.dart';
import 'package:quran_app/features/home/data/sec_api.dart';

import '../../../core/services/DataBase/hive/hive_service.dart';

class HomeRepo {
  final ApiConsumer _homeApi;

  HomeRepo(this._homeApi);

  Future<QuranData> getData() async {
    final response = await _homeApi.get(ApiEndpoints.baseUrl);
    QuranData quranData = QuranData.fromJson(response);
    await HiveService().put(
      DataKeys.boxName,
      DataKeys.quranData,
      quranData.toJson(),
    );
    log('QuranData: $quranData');
    return quranData;
  }
}
