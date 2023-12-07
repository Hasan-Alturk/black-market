import 'package:intl/intl.dart';

class DataFormat {
  static String getDataTime(String dataTime) {
    String data = DateFormat('hh:mm a').format(
      DateTime.parse(dataTime),
    );
    return data;
  }
}
