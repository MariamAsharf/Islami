part of 'radio_cubit.dart';

@immutable
sealed class RadioState {}

final class RadioInitial extends RadioState {}

class RadioLoadingState extends RadioState {}

class RadioFailingState extends RadioState {
  String message;

  RadioFailingState(this.message);
}

class RadioSuccessState extends RadioState {}
