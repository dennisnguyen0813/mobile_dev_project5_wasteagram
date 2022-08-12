import 'dart:io';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:wasteagram/widgets/circular_progress_column.dart';
import 'package:wasteagram/widgets/list_widgets.dart';

class ListScreen extends StatefulWidget {
  final FirebaseAnalyticsObserver observer;
  final FirebaseAnalytics analytics;
  const ListScreen({
    Key? key,
    required this.observer,
    required this.analytics,
  }) : super(key: key);

  @override
  // ignore: no_logic_in_create_state
  State<ListScreen> createState() => _ListScreenState(analytics, observer);
}

class _ListScreenState extends State<ListScreen> {
  _ListScreenState(this.analytics, this.observer);
  late final FirebaseAnalyticsObserver observer;
  late final FirebaseAnalytics analytics;

  final format = DateFormat('EEEE, MMMM, d');

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseFirestore.instance
          .collection('posts')
          .orderBy('date', descending: false)
          .snapshots(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasData &&
            snapshot.data!.docs != null &&
            snapshot.data!.docs.isNotEmpty) {
          return WasteListScaffold(
            snapshot: snapshot,
            observer: observer,
            analytics: analytics,
          );
        } else {
          return const CircularProgressColumn();
        }
      },
    );
  }
}
