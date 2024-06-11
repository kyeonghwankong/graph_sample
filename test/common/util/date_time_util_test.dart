import 'package:flutter_test/flutter_test.dart';
import 'package:graph_sample/common/util/date_time_util.dart';

void main() {
  group('parseDateTime test', () {
    test('parseDateTime test case 1', () {
      String dateTimeStr = '2023-11-14T02:13:00';
      DateTime? dateTime = parseDateTime(dateTimeStr);
      expect(dateTime != null, true);
      expect(dateTime?.year, 2023);
      expect(dateTime?.month, 11);
      expect(dateTime?.day, 14);
      expect(dateTime?.hour, 2);
      expect(dateTime?.minute, 13);
      expect(dateTime?.second, 0);
    });

    test('parseDateTime test case 2', () {
      String dateTimeStr = '2023-11-14T23:26:00';
      DateTime? dateTime = parseDateTime(dateTimeStr);
      expect(dateTime != null, true);
      expect(dateTime?.year, 2023);
      expect(dateTime?.month, 11);
      expect(dateTime?.day, 14);
      expect(dateTime?.hour, 23);
      expect(dateTime?.minute, 26);
      expect(dateTime?.second, 0);
    });
  });
}
