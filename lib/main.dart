import 'package:flutter/material.dart';
import 'package:graph_sample/dependency_injection.dart';
import 'package:graph_sample/presentation/view/blood_glucose_graph_page.dart';

void main() {
  configureDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Graph Sample',
      theme: ThemeData(colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple)),
      home: const BloodGlucoseGraphPage(),
    );
  }
}
