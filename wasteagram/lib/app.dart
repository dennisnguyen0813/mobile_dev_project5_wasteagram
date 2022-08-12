import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:wasteagram/screens/list_screen.dart';
import 'package:firebase_analytics/firebase_analytics.dart';

class App extends StatelessWidget {
  static FirebaseAnalytics analytics = FirebaseAnalytics.instance;
  static FirebaseAnalyticsObserver observer =
      FirebaseAnalyticsObserver(analytics: analytics);
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Project 5: Wasteagram',
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      navigatorObservers: <NavigatorObserver>[observer],
      home: ListScreen(
        analytics: analytics,
        observer: observer,
      ),
    );
  }
}
