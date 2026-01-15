import 'package:flutter/material.dart';

// Note: Ensure you import your theme/responsive helpers if needed.
// import 'package:mobile_app/helpers/responsive/size_helper_extension.dart';
// import 'package:mobile_app/helpers/theme/theme_helper_extension.dart';

class TodaysSchedule extends StatelessWidget {
  const TodaysSchedule({super.key});

  @override
  Widget build(BuildContext context) {
    // Determine styles based on context (mimicking your existing pattern)
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;

    // Sample Data List
    final List<_ScheduleItem> items = [
      _ScheduleItem(
        title: 'Morning Irrigation',
        subtitle: 'Water wheat crop - Field A',
        time: '6:00 AM - 8:00 AM',
        priority: 'High',
        categoryColor: Colors.blue,
        icon: Icons.water_drop,
        priorityColor: Colors.blue,
      ),
      _ScheduleItem(
        title: 'Fertilizer Application',
        subtitle: 'Apply NPK to corn - Field B',
        time: '10:00 AM - 12:00 PM',
        priority: 'Med',
        categoryColor: const Color(0xFFF58B33), // Orange
        icon: Icons.agriculture, // or Icons.science
        priorityColor: const Color(0xFFF58B33),
      ),
      _ScheduleItem(
        title: 'Pest Monitoring',
        subtitle: 'Check tomatoes for aphids',
        time: '2:00 PM - 3:00 PM',
        priority: 'Low',
        categoryColor: const Color(0xFFAE52D4), // Purple
        icon: Icons.pest_control,
        priorityColor: Colors.green, // Note: Image shows Green badge for Low
      ),
    ];

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header Row
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Today's Schedule",
                style: textTheme.titleLarge!.copyWith(
                  fontWeight: FontWeight.bold,
                  color: colorScheme.onSurface,
                ),
              ),
              Text(
                "${DateTime.now().year}-${DateTime.now().month}-${DateTime.now().day}",
                style: textTheme.bodyMedium!.copyWith(
                  color: colorScheme.onSurfaceVariant,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          // List of Cards
          ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: items.length,
            separatorBuilder: (context, index) => const SizedBox(height: 12),
            itemBuilder: (context, index) {
              return _ScheduleCard(item: items[index]);
            },
          ),
        ],
      ),
    );
  }
}

// Data Model
class _ScheduleItem {
  final String title;
  final String subtitle;
  final String time;
  final String priority;
  final Color categoryColor;
  final IconData icon;
  final Color priorityColor;

  _ScheduleItem({
    required this.title,
    required this.subtitle,
    required this.time,
    required this.priority,
    required this.categoryColor,
    required this.icon,
    required this.priorityColor,
  });
}

// Reusable Card Widget
class _ScheduleCard extends StatelessWidget {
  final _ScheduleItem item;

  const _ScheduleCard({required this.item});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;

    return Container(
      decoration: BoxDecoration(
        color: colorScheme.surface, // or Colors.white
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: IntrinsicHeight(
        child: Row(
          children: [
            // Colored Left Bar
            Container(
              width: 6,
              decoration: BoxDecoration(
                color: item.categoryColor,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(16),
                  bottomLeft: Radius.circular(16),
                ),
              ),
            ),
            // Content Section
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 16,
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Icon Box
                    Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: item.categoryColor.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Icon(
                        item.icon,
                        color: item.categoryColor,
                        size: 24,
                      ),
                    ),
                    const SizedBox(width: 16),
                    // Texts
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            item.title,
                            style: textTheme.titleMedium!.copyWith(
                              fontWeight: FontWeight.bold,
                              color: colorScheme.onSurface,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            item.subtitle,
                            style: textTheme.bodyMedium!.copyWith(
                              color: colorScheme.onSurfaceVariant,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                          const SizedBox(height: 8),
                          Row(
                            children: [
                              Icon(
                                Icons.access_time_rounded,
                                size: 16,
                                color: colorScheme.onSurfaceVariant,
                              ),
                              const SizedBox(width: 4),
                              Text(
                                item.time,
                                style: textTheme.bodySmall!.copyWith(
                                  color: colorScheme.onSurfaceVariant,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    // Priority Badge
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 4,
                      ),
                      decoration: BoxDecoration(
                        color: item.priorityColor.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Text(
                        item.priority,
                        style: textTheme.labelSmall!.copyWith(
                          color: item.priorityColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
