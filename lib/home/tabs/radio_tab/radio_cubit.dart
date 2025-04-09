import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:islami_app/home/tabs/radio_tab/radio_state.dart';
import 'package:islami_app/home/tabs/radio_tab/repo/radio_reposetory.dart';
import 'package:islami_app/home/tabs/radio_tab/repo/reciters_reposetory.dart';
import 'package:islami_app/home/tabs/radio_tab/shared_audio_player.dart';

class RadioCubit extends Cubit<RadioStates> {
  RadioCubit() : super(RadioInitial());

  static RadioCubit get(context) => BlocProvider.of(context);

  List<Radios> radios = [];
  List<Reciters> reciters = [];
  int currentTabIndex = 0;

  Future<void> getRadios() async {
    emit(RadioLoading());
    try {
      final response = await Dio().get('https://mp3quran.net/api/v3/radios');
      print('Response for Radios: $response');
      final data = RadioReposetory.fromJson(response.data);
      radios = data.radios ?? [];
      emit(RadioSuccess(radios: radios));
    } catch (e) {
      emit(RadioError(e.toString()));
    }
  }

  Future<void> getReciters() async {
    emit(reciterLoading());
    try {
      final response =
          await Dio().get('https://www.mp3quran.net/api/v3/reciters');
      print('Response for Reciters: $response');
      if (response.statusCode == 200) {
        final data = RecitersReposetory.fromJson(response.data);
        reciters = data.reciters ?? [];
        emit(reciterSuccess(reciters: reciters));
      } else {
        emit(reciterError("Failed to load reciters"));
      }
    } catch (e) {
      print("Error occurred: $e");
      emit(reciterError("Error occurred while fetching reciters"));
    }
  }

  void changeTab(int index) async {
    if (index == 0) {
      await getRadios();
    }

    if (index == 1) {
      await getReciters();
    }

    if (currentTabIndex != index) {
      await SharedAudioPlayer().stop();
    }

    currentTabIndex = index;
    emit(TabChanged(index));
  }
}
