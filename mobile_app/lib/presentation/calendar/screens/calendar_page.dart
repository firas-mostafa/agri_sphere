import 'package:flutter/material.dart';
import 'package:mobile_app/presentation/calendar/widget/calendar.dart';
import 'package:mobile_app/presentation/calendar/widget/todays_schedule.dart';
import 'package:mobile_app/presentation/calendar/widget/upcoming_tasks.dart';

class CalendarPage extends StatelessWidget {
  const CalendarPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: const Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [Calendar(), TodaysSchedule(), UpcomingTasks()],
          ),
        ),
      ),
    );
  }
}
