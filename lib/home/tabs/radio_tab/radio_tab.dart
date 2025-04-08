import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:islami_app/home/tabs/radio_tab/radio_cubit.dart';
import 'package:islami_app/home/tabs/radio_tab/radio_state.dart';
import 'package:islami_app/home/tabs/radio_tab/widgets/radio_item_widget.dart';
import 'package:islami_app/home/tabs/radio_tab/widgets/reciters_item_widget.dart';
import 'package:islami_app/my_theme/my_theme.dart';
import 'package:toggle_switch/toggle_switch.dart';

class RadioTab extends StatelessWidget {
  const RadioTab({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RadioCubit()..getRadios()..getReciters(),
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
                final cubit = BlocProvider.of<RadioCubit>(context);
                if (index != null) {
                  cubit.changeTab(index);
                }
              },
            ),
            SizedBox(height: 10),
            Expanded(
              child: BlocBuilder<RadioCubit, RadioStates>(
                builder: (context, state) {
                  if (state is RadioLoading || state is reciterLoading) {
                    return Center(child: CircularProgressIndicator());
                  } else if (state is RadioError || state is reciterError) {
                    return Center(
                      child: Text(
                        state.toString(),
                      ),
                    );
                  } else if (state is RadioSuccess) {
                    final radios = state.radios;
                    print('Displaying Radios: $radios');
                    return ListView.separated(
                      scrollDirection: Axis.vertical,
                      itemBuilder: (context, index) {
                        final radio = radios[index];
                        return RadioItemWidget(radio: radio);
                      },
                      separatorBuilder: (context, index) => SizedBox(height: 8),
                      itemCount: radios.length,
                    );
                  } else if (state is reciterSuccess) {
                    final reciters = state.reciters;
                    print('Displaying Reciters: $reciters');
                    return ListView.separated(
                      scrollDirection: Axis.vertical,
                      itemBuilder: (context, index) {
                        final reciter = reciters[index];
                        return RecitersItemWidget(reciter: reciter);
                      },
                      separatorBuilder: (context, index) => SizedBox(height: 8),
                      itemCount: reciters.length,
                    );
                  }
                  return Container();
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
