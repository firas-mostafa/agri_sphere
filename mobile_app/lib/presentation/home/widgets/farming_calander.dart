import 'package:flutter/material.dart';
import 'package:mobile_app/helpers/responsive/size_helper_extension.dart';
import 'package:mobile_app/helpers/theme/theme_helper_extension.dart';

class FarmingCalander extends StatefulWidget {
  const FarmingCalander({super.key});

  @override
  State<FarmingCalander> createState() => _FarmingCalanderState();
}

class _FarmingCalanderState extends State<FarmingCalander> {
  DateTime _visibleMonth = DateTime.now();
  int? _selectedDay;

  // sample event dots (day -> list of colors)
  final Map<int, List<Color>> _events = {
    9: [Colors.blue],
    11: [Colors.orange],
    15: [Colors.purple],
    17: [Colors.green],
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
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: context.colorScheme.shadow.withAlpha(50),
            blurRadius: 8,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      padding: EdgeInsets.symmetric(horizontal: context.setMineSize(10)),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                icon: const Icon(Icons.chevron_left),
                onPressed: _prevMonth,
              ),
              Text(
                monthLabel,
                style: context.textTheme.titleMedium!.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              IconButton(
                icon: const Icon(Icons.chevron_right),
                onPressed: _nextMonth,
              ),
            ],
          ),
          SizedBox(height: context.setMineSize(3)),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              _WeekdayLabel('Sun'),
              _WeekdayLabel('Mon'),
              _WeekdayLabel('Tue'),
              _WeekdayLabel('Wed'),
              _WeekdayLabel('Thu'),
              _WeekdayLabel('Fri'),
              _WeekdayLabel('Sat'),
            ],
          ),
          SizedBox(height: context.setMineSize(3)),
          SizedBox(
            height: context.setHeight(300),
            child: GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 7,
                childAspectRatio: 1.25,
              ),
              itemCount: firstWeekday + daysInMonth,
              itemBuilder: (context, index) {
                if (index < firstWeekday) return const SizedBox.shrink();
                final day = index - firstWeekday + 1;
                final isSelected = _selectedDay == day;
                final hasEvents = _events.containsKey(day);
                return GestureDetector(
                  onTap: () => setState(() => _selectedDay = day),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: context.setMineSize(32),
                        height: context.setMineSize(32),
                        decoration: isSelected
                            ? BoxDecoration(
                                color: context.colorScheme.primary,
                                borderRadius: BorderRadius.circular(8),
                              )
                            : null,
                        alignment: Alignment.center,
                        child: Text(
                          '$day',
                          style: context.textTheme.bodyMedium!.copyWith(
                            color: isSelected
                                ? context.colorScheme.onInverseSurface
                                : context.colorScheme.onSurface,
                            fontWeight: isSelected
                                ? FontWeight.w700
                                : FontWeight.w400,
                          ),
                        ),
                      ),
                      if (hasEvents)
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: _events[day]!.take(3).map((c) {
                            return Container(
                              width: context.setMineSize(6),
                              height: context.setMineSize(6),
                              margin: EdgeInsets.symmetric(
                                horizontal: context.setMineSize(1),
                              ),
                              decoration: BoxDecoration(
                                color: c,
                                shape: BoxShape.circle,
                              ),
                            );
                          }).toList(),
                        ),
                    ],
                  ),
                );
              },
            ),
          ),
          const Divider(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: const [
              _LegendDot(color: Colors.blue, label: 'Irrigation'),

              _LegendDot(color: Colors.orange, label: 'Fertilizer'),

              _LegendDot(color: Colors.purple, label: 'Pest Check'),
            ],
          ),
          SizedBox(height: context.setMineSize(10)),
        ],
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
          style: context.textTheme.bodySmall!.copyWith(
            color: context.colorScheme.onSurfaceVariant,
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
        CircleAvatar(radius: context.setMineSize(6), backgroundColor: color),
        const SizedBox(width: 6),
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
