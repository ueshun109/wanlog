enum TimeUnit {
  minutes,
  hour,
  day,
}

extension ToString on TimeUnit {
  String get japanese {
    switch (this) {
      case TimeUnit.minutes: return "分";
      case TimeUnit.hour: return "時間";
      case TimeUnit.day: return "日";
    }
  }
}