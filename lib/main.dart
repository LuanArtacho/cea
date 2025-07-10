import 'package:flutter/material.dart';
import 'package:cea_app/pages/home_page.dart';
import 'package:fl_chart/fl_chart.dart';
import 'dart:async';

void main() => runApp(QuizApp());

class QuizApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Quiz CEA',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: HomePage(),
    );
  }
}
