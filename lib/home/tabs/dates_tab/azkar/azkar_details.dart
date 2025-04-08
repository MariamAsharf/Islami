// screens/azkar_details_screen.dart
import 'package:flutter/material.dart';
import 'package:islami_app/home/tabs/dates_tab/repo/zekr_item_model.dart';

class AzkarDetails extends StatelessWidget {
  static const String routeName = "AzkarDetails";

  final String title;
  final List<ZekrItemModel> azkarList;

  const AzkarDetails({
    super.key,
    required this.title,
    required this.azkarList,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Azkar",
          style: Theme.of(context).textTheme.titleMedium),
        ),
    
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: ListView.builder(
          itemCount: azkarList.length,
          itemBuilder: (context, index) {
            final item = azkarList[index];
            return Card(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (item.content != null)
                      Text(item.content!, style: TextStyle(fontSize: 18)),
                    if (item.reference != null)
                      Text('📌 ${item.reference!}',
                          style: TextStyle(color: Colors.grey)),
                    if (item.count != null)
                      Text('🔁 العدد: ${item.count!}',
                          style: TextStyle(color: Colors.teal)),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
