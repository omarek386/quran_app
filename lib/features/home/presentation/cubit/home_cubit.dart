import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quran_app/core/services/API/constants/data_keys.dart';
import 'package:quran_app/core/services/API/consumers/api_consumer.dart';
import 'package:quran_app/core/services/DataBase/hive/hive_service.dart';
import 'package:quran_app/features/home/data/sec_api.dart';
import 'package:quran_app/features/home/repo/home_repo.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit({required this.apiConsumer}) : super(HomeInitial());
  final ApiConsumer apiConsumer;
  late final HomeRepo _homeRepo = HomeRepo(apiConsumer);

  Future<QuranData?> getSwarData() async {
    var snapshot = await HiveService().get(
      DataKeys.boxName,
      DataKeys.quranData,
    );
    if (snapshot != null) {
      QuranData data = QuranData.fromJson(snapshot);
      _homeRepo.getData(); // update Data
      return data;
    } else {
      try {
        final data = await _homeRepo.getData();
        return data;
      } catch (e) {
        emit(HomeError(e.toString()));
      }
    }

    return null;
  }
}
