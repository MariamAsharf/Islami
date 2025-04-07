import 'package:islami_app/home/tabs/radio_tab/repo/radio_reposetory.dart';
import 'package:islami_app/home/tabs/radio_tab/repo/reciters_reposetory.dart';

abstract class RadioStates {}

class RadioInitial extends RadioStates {}

class RadioLoading extends RadioStates {}

class RadioSuccess extends RadioStates {
  final List<Radios> radios;

  RadioSuccess({required this.radios});
}

class RadioError extends RadioStates {
  final String error;

  RadioError(this.error);
}

class reciterLoading extends RadioStates {}

class reciterSuccess extends RadioStates {
  final List<Reciters> reciters;

  reciterSuccess({required this.reciters});
}

class reciterError extends RadioStates {
  final String error;

  reciterError(this.error);
}
