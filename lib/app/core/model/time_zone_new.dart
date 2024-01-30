class TimeZone {
  TimeZone({
    required this.year,
    required this.month,
    required this.day,
    required this.hour,
    required this.minute,
    required this.seconds,
    required this.milliSeconds,
    required this.dateTime,
    required this.date,
    required this.time,
    required this.dayOfWeek,
    required this.timeZone,
    required this.dstActive,
  });

  final int? year;
  final int? month;
  final int? day;
  final int? hour;
  final int? minute;
  final int? seconds;
  final int? milliSeconds;
  final String? dateTime;
  final String? dayOfWeek;
  final bool dstActive;
  final String? date;
  final String? time;
  final String? timeZone;

  factory TimeZone.fromJson(Map<String, dynamic> json) {
    return TimeZone(
      year: json["year"],
      month: json["month"],
      day: json["day"],
      hour: json["hour"],
      minute: json["minute"],
      seconds: json["seconds"],
      milliSeconds: json["milliSeconds"],
      dateTime: json["dateTime"],
      timeZone: json["timeZone"],
      date: json["date"],
      time: json["time"],
      dayOfWeek: json["dayOfWeek"],
      dstActive: json["dstActive"],
    );
  }

  Map<String, dynamic> toJson() => {
        "year": year,
        "month": month,
        "day": day,
        "hour": hour,
        "minute": minute,
        "seconds": seconds,
        "milliSeconds": milliSeconds,
        "date": date,
        "time": time,
        "dateTime": dateTime,
        "timeZone": timeZone,
        "dayOfWeek": dayOfWeek,
        "dstActive": dstActive,
      };
}
