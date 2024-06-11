import 'package:flutter_test/flutter_test.dart';
import 'package:graph_sample/data/data_source/mock_data_source.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  final dataSource = MockDataSource();

  group('getBloodGlucoseGraph() test', () {
    test('happy case', () async {
      final response = await dataSource.getBloodGlucoseGraph();
      final data = response.data;
      if (data == null) {
        return throw Error();
      }

      expect(data.points.isNotEmpty, true);
      expect(data.points.first.dateTime != null, true);
      expect(data.points.first.x > 0, true);
      expect(data.points.first.y > 0, true);
      expect(data.points.last.dateTime != null, true);
      expect(data.points.last.x > 0, true);
      expect(data.points.last.y > 0, true);
    });
  });

  group('loadMockData() test', () {
    test('happy case', () async {
      final mockData = await dataSource.loadMockData(mockDataPath);
      expect(mockData.points.isNotEmpty, true);
      expect(mockData.points.first.dateTime != null, true);
      expect(mockData.points.first.x > 0, true);
      expect(mockData.points.first.y > 0, true);
      expect(mockData.points.last.dateTime != null, true);
      expect(mockData.points.last.x > 0, true);
      expect(mockData.points.last.y > 0, true);
    });

    test('wrong path case', () async {
      expect(
        () async => await dataSource.loadMockData(''),
        throwsA(isA<Error>()),
      );
    });
  });
}
