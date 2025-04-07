import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:islami_app/home/tabs/radio_tab/radio_state.dart';
import 'package:islami_app/home/tabs/radio_tab/repo/radio_reposetory.dart';
import 'package:islami_app/home/tabs/radio_tab/repo/reciters_reposetory.dart';

class RadioCubit extends Cubit<RadioStates> {
  RadioCubit() : super(RadioInitial());

  static RadioCubit get(context) => BlocProvider.of(context);

  List<Radios> radios = [];
  List<Reciters> reciters = [];

  Future<void> getRadios() async {
    if (radios.isNotEmpty) return;  // إذا كانت البيانات محملة مسبقًا لا نقوم بتحميلها مرة أخرى
    emit(RadioLoading());
    try {
      final response = await Dio().get('https://mp3quran.net/api/v3/radios');
      final data = RadioReposetory.fromJson(response.data);
      radios = data.radios ?? [];
      emit(RadioSuccess(radios: radios));
    } catch (e) {
      emit(RadioError(e.toString()));
    }
  }

  Future<void> getReciters() async {
    if (reciters.isNotEmpty) return;  // إذا كانت البيانات محملة مسبقًا لا نقوم بتحميلها مرة أخرى
    emit(reciterLoading());
    try {
      final response = await Dio().get('https://www.mp3quran.net/api/v3/reciters?language=ar');
      final data = RecitersReposetory.fromJson(response.data);
      reciters = data.reciters ?? [];
      emit(reciterSuccess(reciters: reciters));
    } catch (e) {
      emit(reciterError(e.toString()));
    }
  }

  Future<void> changeTab(int index) async {
    if (index == 0) {
      await getRadios();
    } else if (index == 1) {
      await getReciters();
    }
  }
}
