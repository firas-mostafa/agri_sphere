import 'package:flutter/material.dart';
import 'package:mobile_app/helpers/responsive/size_helper_extension.dart';
import 'package:mobile_app/helpers/theme/theme_helper_extension.dart';

class TodayTasks extends StatefulWidget {
  const TodayTasks({super.key});

  @override
  State<TodayTasks> createState() => _TodayTasksState();
}

class _TodayTasksState extends State<TodayTasks> {
  @override
  Widget build(BuildContext context) {
    final tasks = [
      {
        'title': 'Irrigation - Field A',
        'subtitle': 'Water the wheat crop for 2 hours',
        'time': '6:00 AM - 8:00 AM',
        'priority': 'High Priority',
        'priorityColor': Colors.blue,
        'icon': Icons.water_drop,
      },
      {
        'title': 'Fertilizer Application',
        'subtitle': 'Apply NPK fertilizer to corn field',
        'time': '10:00 AM - 12:00 PM',
        'priority': 'Medium',
        'priorityColor': Colors.amber,
        'icon': Icons.grass,
      },
      {
        'title': 'Pest Monitoring',
        'subtitle': 'Check for aphids in tomato section',
        'time': '2:00 PM - 3:00 PM',
        'priority': 'Low',
        'priorityColor': Colors.green,
        'icon': Icons.bug_report,
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
                  Container(
                    width: 48,
                    height: 48,
                    decoration: BoxDecoration(
                      color: (t['priorityColor'] as Color).withAlpha(30),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Icon(
                      t['icon'] as IconData,
                      color: t['priorityColor'] as Color,
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
                                t['title'] as String,
                                style: context.textTheme.titleMedium!.copyWith(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            Checkbox(
                              value: true,
                              onChanged: (v) {},
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(4),
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
                            Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 8,
                                vertical: 4,
                              ),
                              decoration: BoxDecoration(
                                color: (t['priorityColor'] as Color).withAlpha(
                                  40,
                                ),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Text(
                                t['priority'] as String,
                                style: TextStyle(
                                  color: t['priorityColor'] as Color,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
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
