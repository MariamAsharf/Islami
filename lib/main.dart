import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:islami_app/cache/cache_helper.dart';
import 'package:islami_app/home/tabs/radio_tab/radio_cubit.dart';
import 'package:islami_app/my_theme/my_theme.dart';
import 'home/tabs/ahadeth_tab/hadith_details/hadith_details_screen.dart';
import 'home/tabs/quran_tab/sura_details/sura_details.dart';
import 'home_screen.dart';
import 'onboarding_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CacheHelper.init();
  runApp(const IslamiApp());
}

class IslamiApp extends StatelessWidget {
  const IslamiApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RadioCubit(),
      child: MaterialApp(
        theme: MYTheme.lightTheme,
        darkTheme: MYTheme.darkTheme,
        themeMode: ThemeMode.light,
        debugShowCheckedModeBanner: false,
        initialRoute: CacheHelper.getEligibility() == true
            ? HomeScreen.routeName
            : OnboardingScreen.routeName,
        routes: {
          OnboardingScreen.routeName: (context) => const OnboardingScreen(),
          SuraDetailsScreen.routeName: (context) => SuraDetailsScreen(),
          HadithDetailsScreen.routeName: (context) => HadithDetailsScreen(),
          HomeScreen.routeName: (context) => const HomeScreen(),
        },
      ),
    );
  }
}
