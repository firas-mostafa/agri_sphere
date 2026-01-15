import 'package:flutter/material.dart';

class UpcomingTasks extends StatelessWidget {
  const UpcomingTasks({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;

    // Sample Data based on image
    final List<_TaskItem> tasks = [
      _TaskItem(
        title: 'Pest Control - Field C',
        date: 'Tomorrow, 9:00 AM',
        color: const Color(0xFFAE52D4), // Purple
      ),
      _TaskItem(
        title: 'Harvest Preparation',
        date: 'Dec 17, 7:00 AM',
        color: const Color(0xFF00A86B), // Green
      ),
      _TaskItem(
        title: 'Soil Testing - Field D',
        date: 'Dec 20, 8:00 AM',
        color: const Color(0xFFE91E63), // Pink/Red
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
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "Upcoming Tasks",
                style: textTheme.titleLarge!.copyWith(
                  fontWeight: FontWeight.bold,
                  color: colorScheme.onSurface,
                ),
              ),
              TextButton(
                onPressed: () {},
                style: TextButton.styleFrom(
                  padding: EdgeInsets.zero,
                  minimumSize: const Size(50, 30),
                  tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  alignment: Alignment.centerRight,
                ),
                child: Text(
                  "View All",
                  style: textTheme.bodyMedium!.copyWith(
                    color: const Color(0xFF00A86B), // Teal/Green accent
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          // Task List
          ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: tasks.length,
            separatorBuilder: (context, index) => const SizedBox(height: 12),
            itemBuilder: (context, index) {
              return _TaskCard(task: tasks[index]);
            },
          ),
        ],
      ),
    );
  }
}

// Data Model
class _TaskItem {
  final String title;
  final String date;
  final Color color;

  _TaskItem({required this.title, required this.date, required this.color});
}

// Reusable Card Widget
class _TaskCard extends StatelessWidget {
  final _TaskItem task;

  const _TaskCard({required this.task});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      decoration: BoxDecoration(
        color: colorScheme.surface, // or Colors.white
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
        border: Border.all(
          color: colorScheme.outlineVariant.withOpacity(0.2),
          width: 1,
        ),
      ),
      child: Row(
        children: [
          // Colored Dot
          Container(
            width: 8,
            height: 8,
            decoration: BoxDecoration(
              color: task.color,
              shape: BoxShape.circle,
            ),
          ),
          const SizedBox(width: 16),
          // Text Content
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  task.title,
                  style: textTheme.bodyMedium!.copyWith(
                    fontWeight: FontWeight.w500,
                    color: colorScheme.onSurface,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  task.date,
                  style: textTheme.bodyMedium!.copyWith(
                    color: colorScheme.onSurfaceVariant,
                  ),
                ),
              ],
            ),
          ),
          // Chevron Icon
          Icon(
            Icons.chevron_right,
            color: colorScheme.onSurfaceVariant.withOpacity(0.5),
            size: 24,
          ),
        ],
      ),
    );
  }
}
