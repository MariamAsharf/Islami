import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:islami_app/home/tabs/radio_tab/radio_cubit.dart';
import 'package:islami_app/home/tabs/radio_tab/radio_state.dart';
import 'package:islami_app/home/tabs/radio_tab/widgets/media_item_widget.dart'; // تأكد من إضافة import
import 'package:islami_app/my_theme/my_theme.dart';
import 'package:toggle_switch/toggle_switch.dart';

class RadioTab extends StatelessWidget {
  const RadioTab({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RadioCubit()
        ..getRadios()
        ..getReciters(),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Image(
              image: AssetImage("assets/images/onboarding_header.png"),
              width: 291,
              height: 170,
            ),
            SizedBox(height: 7),
            ToggleSwitch(
              minWidth: double.infinity,
              minHeight: 40.0,
              fontSize: 16.0,
              initialLabelIndex: 0,
              cornerRadius: 12,
              activeBgColor: [MYTheme.primaryColor],
              activeFgColor: MYTheme.secondryColor,
              inactiveBgColor: Color(0xB3202020),
              inactiveFgColor: MYTheme.thirdColor,
              totalSwitches: 2,
              labels: ['Radio', 'Reciters'],
              onToggle: (index) {
                print('Toggled to tab: $index');
                RadioCubit.get(context).changeTab(index!);
                if (index == 0) {
                  RadioCubit.get(context).getRadios();
                }
                if (index == 1) {
                  RadioCubit.get(context).getReciters();
                }
              },
            ),
            SizedBox(height: 10),
            Expanded(
              child: BlocBuilder<RadioCubit, RadioStates>(
                builder: (context, state) {
                  final cubit = RadioCubit.get(context);

                  if (state is RadioLoading || state is reciterLoading) {
                    return Center(child: CircularProgressIndicator());
                  }

                  if (state is RadioError || state is reciterError) {
                    return Center(child: Text('Something went wrong'));
                  }

                  if (cubit.currentTabIndex == 0) {
                    if (cubit.radios.isEmpty) {
                      return Center(child: Text('No radios available'));
                    }
                    return ListView.separated(
                      itemBuilder: (context, index) {
                        final radio = cubit.radios[index];
                        return MediaItemWidget(item: radio);
                      },
                      separatorBuilder: (context, index) => SizedBox(height: 8),
                      itemCount: cubit.radios.length,
                    );
                  } else if (cubit.currentTabIndex == 1) {
                    if (cubit.reciters.isEmpty) {
                      return Center(child: Text('No reciters available'));
                    }
                    return ListView.separated(
                      itemBuilder: (context, index) {
                        final reciter = cubit.reciters[index];
                        return MediaItemWidget(item: reciter);
                      },
                      separatorBuilder: (context, index) => SizedBox(height: 8),
                      itemCount: cubit.reciters.length,
                    );
                  }
                  return Container();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
