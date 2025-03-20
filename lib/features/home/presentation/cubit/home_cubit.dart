import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:quran_app/core/services/API/consumers/api_consumer.dart';
import 'package:quran_app/features/home/repo/home_repo.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit({required this.apiConsumer}) : super(HomeInitial());
  final ApiConsumer apiConsumer;
  late final HomeRepo _homeRepo = HomeRepo(apiConsumer);

  Future<void> getSwarData() async {
    final response = await _homeRepo.getHomeData();
    if (response != null) {
    } else {}
  }
}
