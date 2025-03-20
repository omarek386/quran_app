import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quran_app/core/services/API/Errors/server_errors.dart';
import 'package:quran_app/core/services/API/consumers/api_consumer.dart';
import 'package:quran_app/features/home/data/suwar_model.dart';
import 'package:quran_app/features/home/repo/home_repo.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit({required this.apiConsumer}) : super(HomeInitial());
  final ApiConsumer apiConsumer;
  late final HomeRepo _homeRepo = HomeRepo(apiConsumer);

  Future<void> getSwarData() async {
    emit(HomeLoading());
    try {
      List<SuwarModel> suwar = await _homeRepo.getHomeData();
      if (suwar.isNotEmpty) {
        emit(HomeLoaded(suwar));
      } else {
        emit(HomeError("No data available."));
      }
    } on ServerErrors catch (e) {
      emit(HomeError(e.errorModel.errorMessage));
    } catch (e) {
      log(e.toString());
      emit(HomeError('An error occurred.'));
    }
  }
}
