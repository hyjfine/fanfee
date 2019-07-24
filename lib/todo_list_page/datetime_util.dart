class DateTimeUtil {
  static num dateTime2Number(String time) =>
      DateTime.tryParse(time)?.millisecondsSinceEpoch ?? 0;

  /// yyyy-MM-dd HH:mm
  static String dateTimeNormal(String time) {
    if (isNullOrBlank(time))
      return '';
    else if (time.length < 16)
      return time;
    else
      return time.replaceAll('T', ' ').substring(0, 16);
  }

  /// yyyy-MM-dd HH:mm:ss
  static String dateTimeLong(String time) {
    if (isNullOrBlank(time))
      return '';
    else if (time.length < 19) return time;
    return time.replaceAll('T', ' ').substring(0, 19);
  }

  static String simple() => DateTimeUtil.dateTimeSimple(DateTimeUtil.dateTimeNowIso());

  static String dateTimeSimple(String time) {
    if (isNullOrBlank(time))
      return '';
    else if (time.indexOf('T') < 0)
      return time;
    else
      return time.substring(0, time.indexOf('T'));
  }

  static bool isNullOrBlank(String content) =>
      content == null || content.isEmpty;

  static String dateTimeNowIso() => DateTime.now().toIso8601String();

  static int dateTimeNowMilli() => DateTime.now().millisecondsSinceEpoch;
}
