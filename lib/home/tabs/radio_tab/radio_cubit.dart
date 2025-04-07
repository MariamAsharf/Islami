import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:http/http.dart' as http;
import 'package:islami_app/home/tabs/radio_tab/repo/radio_reposetory.dart';
import 'package:meta/meta.dart';

part 'radio_state.dart';

class RadioCubit extends Cubit<RadioState> {
  RadioCubit() : super(RadioInitial());

  getRadio() async {
    emit(RadioLoadingState());
    try {
      Uri url = Uri.parse("https://mp3quran.net/api/");
      http.Response response = await http.get(url);

      if (response.statusCode == 200) {
        var jsonData = jsonDecode(response.body);
        RadioReposetory radioReposetory = RadioReposetory.fromJson(jsonData);

        emit(RadioSuccessState());
      } else {
        emit(RadioFailingState('Failed to load sources'));
      }
    } catch (e) {
      emit(RadioFailingState("Exception: $e"));
    }
  }
}
