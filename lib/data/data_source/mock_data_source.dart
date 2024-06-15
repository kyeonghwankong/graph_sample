import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:graph_sample/common/data/response_model.dart';
import 'package:graph_sample/data/data_source/data_source.dart';
import 'package:graph_sample/data/model/blood_glucose_graph_response_model.dart';
import 'package:injectable/injectable.dart';

@visibleForTesting
const mockDataPath = 'assets/data.json';

@Injectable(as: DataSource)
class MockDataSource implements DataSource {
  @override
  Future<ResponseModel<BloodGlucoseGraphModel>> getBloodGlucoseGraph() async {
    await Future.delayed(const Duration(seconds: 3)); // For loading test

    final data = await loadMockData(mockDataPath);
    return ResponseModel(data: data);
  }

  @visibleForTesting
  Future<BloodGlucoseGraphModel> loadMockData(String path) async {
    try {
      final String jsonString = await rootBundle.loadString(path);
      final List<dynamic> decodedJson = json.decode(jsonString);
      return BloodGlucoseGraphModel(decodedJson.map((e) => BloodGlucoseGraphPointModel.fromJson(e)).toList());
    } catch (e, s) {
      debugPrint(e.toString());
      debugPrint(s.toString());
      return Future.error(e, s);
    }
  }
}
