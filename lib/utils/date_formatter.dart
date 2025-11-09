import 'package:intl/intl.dart';
import 'package:test_evencir/test_evencir.dart';

class DateFormatter {
  DateFormatter._();

  static final DateFormatter _instance = DateFormatter._();

  factory DateFormatter() {
    return _instance;
  }

  List<WeekDateModel> getWeekDatesList(int weekNumber, int year) {
    final firstDayOfYear = DateTime(year, 1, 1);
    final daysToAdd = (DateTime.monday - firstDayOfYear.weekday) % 7;
    final firstMonday = firstDayOfYear.add(Duration(days: daysToAdd));
    final targetMonday = firstMonday.add(Duration(days: (weekNumber - 1) * 7));
    const weekdays = ["M", "TU", "W", "TH", "F", "SA", "SU"];
    final result = <WeekDateModel>[];
    for (int i = 0; i < 7; i++) {
      final date = targetMonday.add(Duration(days: i));
      result.add(
        WeekDateModel.create(
          dayInitial: weekdays[i],
          dateTime: date.toIso8601String(),
        ),
      );
    }
    return result;
  }

  int getTotalWeeksInYear(int year) {
    final date = DateTime(year,12,28);
    return getWeekNumber(date);
  }

  int getWeekNumber(DateTime date) {
    final int dayOfWeek = date.weekday;
    final int daysToThursday = 4 - dayOfWeek;
    final DateTime thursday = date.add(Duration(days: daysToThursday));
    final DateTime firstThursday = DateTime(thursday.year, 1, 4);
    final int weekNumber = ((thursday.difference(firstThursday).inDays) ~/ 7) + 1;
    return weekNumber;
  }

  String formatDate(DateTime date) {
    final formatter = DateFormat('d MMM y');
    final today = DateTime.now();
    if(date.day == today.day) {
      return "Today, ${formatter.format(date)}";
    // } else if(date.day < today.day) {
    //   return "Past Day, ${formatter.format(date)}";
    // } else if(date.day > today.day) {
    //   return "Future Day, ${formatter.format(date)}";
    }
    return formatter.format(date);
  }

  String formatMonthName(DateTime date) {
    final formatter = DateFormat('MMM y');
    return formatter.format(date);
  }

  String getDayName(DateTime date) {
    final formatter = DateFormat('EEE');
    return formatter.format(date);
  }

  bool isDayTime() {
    final now = DateTime.now();
    final hour = now.hour;
    return hour >= 8 && hour < 18;
  }
}