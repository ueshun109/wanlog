import 'package:flutter_test/flutter_test.dart';
import 'package:wanlog/shared_models/notification_date.dart';
import 'package:wanlog/shared_models/time_unit.dart';

void main() {
  test("compareToMinutesAndMinutes", () {
    final beforeDate = NotificationDate(20, TimeUnit.minutes, DateTime.now());
    final afterDate = NotificationDate(10, TimeUnit.minutes, DateTime.now());
    expect(beforeDate.compareTo(afterDate), -1);
    expect(afterDate.compareTo(beforeDate), 1);
  });

  test("compareToMinutesAndHour", () {
    final beforeDate = NotificationDate(1, TimeUnit.hour, DateTime.now());
    final afterDate = NotificationDate(20, TimeUnit.minutes, DateTime.now());
    expect(beforeDate.compareTo(afterDate), -1);
    expect(afterDate.compareTo(beforeDate), 1);
  });

  test("compareToMinutesAndDay", () {
    final beforeDate = NotificationDate(1, TimeUnit.day, DateTime.now());
    final afterDate = NotificationDate(20, TimeUnit.minutes, DateTime.now());
    expect(beforeDate.compareTo(afterDate), -1);
    expect(afterDate.compareTo(beforeDate), 1);
  });

  test("compareToHourAndHour", () {
    final beforeDate = NotificationDate(2, TimeUnit.hour, DateTime.now());
    final afterDate = NotificationDate(1, TimeUnit.hour, DateTime.now());
    expect(beforeDate.compareTo(afterDate), -1);
    expect(afterDate.compareTo(beforeDate), 1);
  });

  test("compareToHourAndDay", () {
    final beforeDate = NotificationDate(1, TimeUnit.day, DateTime.now());
    final afterDate = NotificationDate(2, TimeUnit.hour, DateTime.now());
    expect(beforeDate.compareTo(afterDate), -1);
    expect(afterDate.compareTo(beforeDate), 1);
  });

  test("compareToDayAndDay", () {
    final beforeDate = NotificationDate(2, TimeUnit.day, DateTime.now());
    final afterDate = NotificationDate(1, TimeUnit.day, DateTime.now());
    expect(beforeDate.compareTo(afterDate), -1);
    expect(afterDate.compareTo(beforeDate), 1);
  });
}
