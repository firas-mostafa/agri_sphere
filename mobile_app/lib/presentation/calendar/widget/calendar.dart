import 'package:flutter/material.dart';
import 'package:mobile_app/helpers/responsive/size_helper_extension.dart';
import 'package:mobile_app/helpers/theme/theme_helper_extension.dart';

class Calendar extends StatefulWidget {
  const Calendar({super.key});

  @override
  State<Calendar> createState() => _CalendarState();
}

class _CalendarState extends State<Calendar> {
  DateTime _visibleMonth = DateTime.now();
  int? _selectedDay = 14; // Initially select 14 to match image

  // Define colors based on the image legend
  static const Color _irrigationColor = Color(0xFF4C8BF5);
  static const Color _fertilizerColor = Color(0xFFF58B33);
  static const Color _pestColor = Color(0xFFAE52D4);
  static const Color _harvestColor = Color(0xFF00A86B);

  // Define pastel background colors for unselected event days
  static final Color _irrigationLight = _irrigationColor.withOpacity(0.12);
  static final Color _fertilizerLight = _fertilizerColor.withOpacity(0.12);
  static final Color _pestLight = _pestColor.withOpacity(0.12);
  static final Color _harvestLight = _harvestColor.withOpacity(0.12);

  // Updated events map to match image_0.png
  final Map<int, List<Color>> _events = {
    9: [_irrigationColor, _fertilizerColor],
    11: [_fertilizerColor],
    14: [_harvestColor, _harvestColor, _harvestColor], // Selected in image
    15: [_pestColor],
    17: [_harvestColor, _irrigationColor],
    20: [_pestColor], // Added missing event shown in image
    22: [_irrigationColor],
    28: [_fertilizerColor],
  };

  void _prevMonth() {
    setState(() {
      _visibleMonth = DateTime(_visibleMonth.year, _visibleMonth.month - 1);
      _selectedDay = null;
    });
  }

  void _nextMonth() {
    setState(() {
      _visibleMonth = DateTime(_visibleMonth.year, _visibleMonth.month + 1);
      _selectedDay = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    final year = _visibleMonth.year;
    final month = _visibleMonth.month;
    final firstWeekday = DateTime(year, month, 1).weekday % 7; // Sunday = 0
    final daysInMonth = DateTime(year, month + 1, 0).day;

    final monthLabel = MaterialLocalizations.of(
      context,
    ).formatMonthYear(_visibleMonth);

    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: context.setMineSize(10),
        vertical: context.setMineSize(10),
      ),
      decoration: BoxDecoration(
        color: context.colorScheme.surfaceContainer,
        borderRadius: BorderRadius.circular(20), // Increased radius
        boxShadow: [
          BoxShadow(
            color: context.colorScheme.shadow.withAlpha(30),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      padding: EdgeInsets.all(context.setMineSize(16)),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Header Section
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _CalendarHeaderButton(
                icon: Icons.chevron_left,
                onTap: _prevMonth,
              ),
              Column(
                children: [
                  Text(
                    monthLabel,
                    style: context.textTheme.titleLarge!.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    "Winter Season",
                    style: context.textTheme.bodySmall!.copyWith(
                      color: context.colorScheme.onSurfaceVariant,
                    ),
                  ),
                ],
              ),
              _CalendarHeaderButton(
                icon: Icons.chevron_right,
                onTap: _nextMonth,
              ),
            ],
          ),
          SizedBox(height: context.setMineSize(20)),
          // Weekday Labels
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              _WeekdayLabel('S'),
              _WeekdayLabel('M'),
              _WeekdayLabel('T'),
              _WeekdayLabel('W'),
              _WeekdayLabel('T'),
              _WeekdayLabel('F'),
              _WeekdayLabel('S'),
            ],
          ),
          SizedBox(height: context.setMineSize(10)),
          // Days Grid
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 7,
              childAspectRatio: 1.0, // Square cells
              mainAxisSpacing: 8,
              crossAxisSpacing: 8,
            ),
            itemCount: firstWeekday + daysInMonth,
            itemBuilder: (context, index) {
              if (index < firstWeekday) return const SizedBox.shrink();
              final day = index - firstWeekday + 1;
              final isSelected = _selectedDay == day;
              final hasEvents = _events.containsKey(day);
              final eventColors = _events[day] ?? [];

              // Determine cell styling based on state
              Color? cellBackground;
              Color textColor = context.colorScheme.onSurface;
              Color dotColorOverride = Colors.transparent;

              if (isSelected) {
                // Solid color background for selected day
                // Use the first event color if present, else primary
                cellBackground = eventColors.isNotEmpty
                    ? eventColors.first
                    : context.colorScheme.primary;
                textColor = Colors.white;
                // Dots become white on solid background
                dotColorOverride = Colors.white;
              } else if (hasEvents) {
                // Pastel background for event days not selected
                final primaryEventColor = eventColors.first;
                if (primaryEventColor == _irrigationColor) {
                  cellBackground = _irrigationLight;
                } else if (primaryEventColor == _fertilizerColor) {
                  cellBackground = _fertilizerLight;
                } else if (primaryEventColor == _pestColor) {
                  cellBackground = _pestLight;
                } else if (primaryEventColor == _harvestColor) {
                  cellBackground = _harvestLight;
                }
              }

              return GestureDetector(
                onTap: () => setState(() => _selectedDay = day),
                child: Container(
                  decoration: BoxDecoration(
                    color: cellBackground,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        '$day',
                        style: context.textTheme.titleMedium!.copyWith(
                          color: textColor,
                          fontWeight: isSelected || hasEvents
                              ? FontWeight.w600
                              : FontWeight.w400,
                        ),
                      ),
                      if (hasEvents) ...[
                        const SizedBox(height: 6),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: eventColors.take(3).map((c) {
                            return Container(
                              width: context.setMineSize(6),
                              height: context.setMineSize(6),
                              margin: const EdgeInsets.symmetric(
                                horizontal: 1.5,
                              ),
                              decoration: BoxDecoration(
                                // Use white if selected, else original color
                                color: isSelected ? dotColorOverride : c,
                                shape: BoxShape.circle,
                              ),
                            );
                          }).toList(),
                        ),
                      ],
                    ],
                  ),
                ),
              );
            },
          ),
          SizedBox(height: context.setMineSize(20)),
          // Legend Section
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: const [
              _LegendDot(color: _irrigationColor, label: 'Irrigation'),
              _LegendDot(color: _fertilizerColor, label: 'Fertilizer'),
              _LegendDot(color: _pestColor, label: 'Pest'), // Changed label
              _LegendDot(color: _harvestColor, label: 'Harvest'),
            ],
          ),
        ],
      ),
    );
  }
}

// Custom widget for the header arrows to look like rounded squares
class _CalendarHeaderButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onTap;

  const _CalendarHeaderButton({required this.icon, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: context.colorScheme.surfaceContainerHighest.withOpacity(0.5),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Icon(icon, color: context.colorScheme.onSurfaceVariant),
      ),
    );
  }
}

class _WeekdayLabel extends StatelessWidget {
  final String label;
  const _WeekdayLabel(this.label);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Center(
        child: Text(
          label,
          style: context.textTheme.bodyMedium!.copyWith(
            color: context.colorScheme.onSurfaceVariant.withOpacity(0.7),
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}

class _LegendDot extends StatelessWidget {
  final Color color;
  final String label;
  const _LegendDot({required this.color, required this.label});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(radius: context.setMineSize(5), backgroundColor: color),
        const SizedBox(width: 8),
        Text(
          label,
          style: context.textTheme.bodySmall!.copyWith(
            color: context.colorScheme.onSurfaceVariant,
          ),
        ),
      ],
    );
  }
}
