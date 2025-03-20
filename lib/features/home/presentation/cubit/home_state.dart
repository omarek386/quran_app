part of 'home_cubit.dart';

@immutable
sealed class HomeState {}

final class HomeInitial extends HomeState {}

final class HomeLoading extends HomeState {}

final class HomeLoaded extends HomeState {
  final List<SuwarModel> swar;

  HomeLoaded(this.swar);
}

final class HomeError extends HomeState {
  final String message;
  HomeError(this.message);
}
