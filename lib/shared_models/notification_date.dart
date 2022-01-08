import 'package:wanlog/shared_models/time_unit.dart';

class NotificationDate implements Comparable<NotificationDate> {
  /// 時間の値
  int value;
  /// 時間の単位
  TimeUnit unit;
  /// タイムスタンプ
  late DateTime timestamp;

  NotificationDate(this.value, this.unit, DateTime dateTime) {
    final now = DateTime.now();
    switch (unit) {
      case TimeUnit.minutes:
        timestamp = now.subtract(Duration(minutes: value));
        break;
      case TimeUnit.hour:
        timestamp = now.subtract(Duration(hours: value));
        break;
      case TimeUnit.day:
        timestamp = now.subtract(Duration(days: value));
        break;
    }
  }

  String get string => "$value${unit.japanese}前";

  @override
  int compareTo(NotificationDate other) {
    if (timestamp.isBefore(other.timestamp)) {
      return -1;
    } else if(timestamp.isAfter(other.timestamp)) {
      return 1;
    } else {
      return 0;
    }
  }
}