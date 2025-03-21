import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quran_app/core/services/API/consumers/api_consumer.dart';
import 'package:quran_app/features/home/data/sec_api.dart';
import 'package:quran_app/features/home/repo/home_repo.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit({required this.apiConsumer}) : super(HomeInitial());
  final ApiConsumer apiConsumer;
  late final HomeRepo _homeRepo = HomeRepo(apiConsumer);

  Future<QuranData> getSwarData() async {
    return await _homeRepo.getData();
  }
}
