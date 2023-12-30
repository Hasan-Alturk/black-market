class Time {
    Time({
        required this.abbreviation,
        required this.clientIp,
        required this.datetime,
        required this.dayOfWeek,
        required this.dayOfYear,
        required this.dst,
        required this.dstFrom,
        required this.dstOffset,
        required this.dstUntil,
        required this.rawOffset,
        required this.timezone,
        required this.unixtime,
        required this.utcDatetime,
        required this.utcOffset,
        required this.weekNumber,
    });

    final String? abbreviation;
    final String? clientIp;
    final DateTime? datetime;
    final int? dayOfWeek;
    final int? dayOfYear;
    final bool? dst;
    final dynamic dstFrom;
    final int? dstOffset;
    final dynamic dstUntil;
    final int? rawOffset;
    final String? timezone;
    final int? unixtime;
    final DateTime? utcDatetime;
    final String? utcOffset;
    final int? weekNumber;

    factory Time.fromJson(Map<String, dynamic> json){ 
        return Time(
            abbreviation: json["abbreviation"],
            clientIp: json["client_ip"],
            datetime: DateTime.tryParse(json["datetime"] ?? ""),
            dayOfWeek: json["day_of_week"],
            dayOfYear: json["day_of_year"],
            dst: json["dst"],
            dstFrom: json["dst_from"],
            dstOffset: json["dst_offset"],
            dstUntil: json["dst_until"],
            rawOffset: json["raw_offset"],
            timezone: json["timezone"],
            unixtime: json["unixtime"],
            utcDatetime: DateTime.tryParse(json["utc_datetime"] ?? ""),
            utcOffset: json["utc_offset"],
            weekNumber: json["week_number"],
        );
    }

    Map<String, dynamic> toJson() => {
        "abbreviation": abbreviation,
        "client_ip": clientIp,
        "datetime": datetime?.toIso8601String(),
        "day_of_week": dayOfWeek,
        "day_of_year": dayOfYear,
        "dst": dst,
        "dst_from": dstFrom,
        "dst_offset": dstOffset,
        "dst_until": dstUntil,
        "raw_offset": rawOffset,
        "timezone": timezone,
        "unixtime": unixtime,
        "utc_datetime": utcDatetime?.toIso8601String(),
        "utc_offset": utcOffset,
        "week_number": weekNumber,
    };

}
