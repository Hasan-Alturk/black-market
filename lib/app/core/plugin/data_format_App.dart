
// ignore_for_file: file_names

import 'package:intl/intl.dart';

class DataFormatApp {
  static String getDataTime(String dataTime) {
    String data = DateFormat('hh:mm a').format(
      DateTime.parse(dataTime),
    );
    return data;
  }

  static String getCurrentDate() {
    // حصول على التاريخ الحالي
    DateTime now = DateTime.now();

    // تنسيق التاريخ
    String formattedDate = DateFormat('yyyy/MM/dd').format(now);

    return formattedDate;
  }
}
