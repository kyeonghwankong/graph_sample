DateTime? parseDateTime(String? dateTimeStr) {
  if (dateTimeStr?.isNotEmpty ?? false) {
    return DateTime.tryParse(dateTimeStr!);
  }

  return null;
}

String formatDateTimeToTime(DateTime? dateTime) {
  if (dateTime == null) {
    return '';
  }

  final hour = dateTime.hour;
  final period = hour >= 12 ? '오후' : '오전';
  final int hourIn12HourFormat;
  if (hour % 12 == 0) {
    hourIn12HourFormat = 0;
  } else {
    hourIn12HourFormat = hour % 12;
  }

  final minute = dateTime.minute.toString().padLeft(2, '0');

  return '$period $hourIn12HourFormat시 $minute분';
}

String convertMinutesToTime(int totalMinutes) {
  final hours = totalMinutes ~/ 60;
  final minutes = totalMinutes % 60;
  final period = hours >= 12 ? '오후' : '오전';
  final displayHours = hours % 12 == 0 ? 12 : hours % 12;
  return '$period $displayHours시 $minutes분';
}

