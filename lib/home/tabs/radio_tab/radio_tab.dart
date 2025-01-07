import 'package:flutter/material.dart';
import 'package:islami_app/my_theme/my_theme.dart';
import 'package:toggle_switch/toggle_switch.dart';

class RadioTab extends StatelessWidget {
  const RadioTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
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
            labels: ['Radio','Reciters'],
            onToggle: (index) {
              print('switched to: $index');
            },
          ),
          SizedBox(height: 10),
          Expanded(
            child: ListView.separated(
                scrollDirection: Axis.vertical,
                itemBuilder: (context, index) {
                  return Container(
                    height: 133,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: MYTheme.primaryColor,
                    ),
                    child: Stack(
                      alignment: Alignment.bottomCenter,
                      children: [
                        Image(
                          image: AssetImage("assets/images/Mosque-02.png"),
                        ),
                        Column(
                          children: [
                            SizedBox(height: 12),
                            Text(
                              "Radio Ibrahim Al-Akdar",
                              style: Theme.of(context)
                                  .textTheme
                                  .titleMedium
                                  ?.copyWith(color: MYTheme.secondryColor),
                            ),
                            SizedBox(height: 24),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                IconButton(
                                  onPressed: () {},
                                  icon: ImageIcon(
                                    AssetImage("assets/images/Vector.png"),
                                    color: MYTheme.secondryColor,
                                  ),
                                ),
                                SizedBox(width: 16),
                                IconButton(
                                  onPressed: () {},
                                  icon: ImageIcon(
                                    AssetImage("assets/images/Polygon 2.png"),
                                    color: MYTheme.secondryColor,
                                  ),
                                ),
                                SizedBox(width: 16),
                                IconButton(
                                  onPressed: () {},
                                  icon: ImageIcon(
                                    AssetImage("assets/images/Volume High.png"),
                                    color: MYTheme.secondryColor,
                                  ),
                                ),
                              ],
                            )
                          ],
                        )
                      ],
                    ),
                  );
                },
                separatorBuilder: (context, index) => SizedBox(height: 8),
                itemCount: 15),
          )
        ],
      ),
    );
  }
}
