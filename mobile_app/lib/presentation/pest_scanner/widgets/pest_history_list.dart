import 'package:flutter/material.dart';
import 'package:mobile_app/helpers/responsive/size_helper_extension.dart';
import 'package:mobile_app/helpers/theme/theme_helper_extension.dart';

class PestHistoryList extends StatefulWidget {
  const PestHistoryList({super.key});

  @override
  State<PestHistoryList> createState() => _PestHistoryListState();
}

class _PestHistoryListState extends State<PestHistoryList> {
  @override
  Widget build(BuildContext context) {
    final tasks = [
      {
        'name': 'Irrigation - Field A',
        'subtitle': 'Water the wheat crop for 2 hours',
        'time': '6:00 AM - 8:00 AM',
        'risk': 'High risk',
        'riskColor': Colors.blue,
        'image':
            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSWz1C2s-9LwDrhuLZIFZ766GmVdnzEPgeYwg&s",
      },
      {
        'name': 'Fertilizer Application',
        'subtitle': 'Apply NPK fertilizer to corn field',
        'time': '10:00 AM - 12:00 PM',
        'risk': 'Medium',
        'riskColor': Colors.amber,
        'image':
            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSWz1C2s-9LwDrhuLZIFZ766GmVdnzEPgeYwg&s",
      },
      {
        'name': 'Pest Monitoring',
        'subtitle': 'Check for aphids in tomato section',
        'time': '2:00 PM - 3:00 PM',
        'risk': 'Low',
        'riskColor': Colors.green,
        'image':
            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSWz1C2s-9LwDrhuLZIFZ766GmVdnzEPgeYwg&s",
      },
    ];
    return Column(
      children: List.generate(tasks.length, (index) {
        final t = tasks[index];
        return Padding(
          padding: EdgeInsets.symmetric(
            vertical: context.setMineSize(10),
            horizontal: context.setMineSize(10),
          ),
          child: Container(
            decoration: BoxDecoration(
              color: context.colorScheme.surfaceContainer,
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: context.colorScheme.shadow.withAlpha(40),
                  blurRadius: 8,
                  offset: const Offset(0, 3),
                ),
              ],
            ),
            child: Padding(
              padding: EdgeInsets.all(context.setMineSize(10)),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: context.setMineSize(110),
                    height: context.setMineSize(110),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image.network(
                        t['image'] as String,
                        // color: t['riskColor'] as Color,
                        cacheHeight: 150,
                        cacheWidth: 150,
                      ),
                    ),
                  ),
                  SizedBox(width: context.setMineSize(12)),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: Text(
                                t['name'] as String,
                                style: context.textTheme.titleMedium!.copyWith(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 8,
                                vertical: 4,
                              ),
                              decoration: BoxDecoration(
                                color: (t['riskColor'] as Color).withAlpha(40),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Text(
                                t['risk'] as String,
                                style: TextStyle(
                                  color: t['riskColor'] as Color,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: context.setMineSize(4)),
                        Text(
                          t['subtitle'] as String,
                          style: context.textTheme.bodyMedium!.copyWith(
                            color: context.colorScheme.onSurface.withAlpha(150),
                          ),
                        ),
                        SizedBox(height: context.setMineSize(12)),
                        Row(
                          children: [
                            Icon(
                              Icons.access_time,
                              size: 16,
                              color: context.colorScheme.onSurface.withAlpha(
                                150,
                              ),
                            ),
                            const SizedBox(width: 6),
                            Text(
                              t['time'] as String,
                              style: TextStyle(
                                color: context.colorScheme.onSurface.withAlpha(
                                  150,
                                ),
                              ),
                            ),
                            SizedBox(width: context.setMineSize(12)),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      }),
    );
  }
}
