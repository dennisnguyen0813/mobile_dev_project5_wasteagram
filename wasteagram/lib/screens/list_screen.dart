import 'dart:io';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:wasteagram/main.dart';

import 'package:wasteagram/widgets/camera_fab.dart';
import 'package:wasteagram/widgets/circular_progress_column.dart';
import 'package:wasteagram/widgets/list_widgets.dart';

class ListScreen extends StatefulWidget {
  const ListScreen({Key? key}) : super(key: key);

  @override
  State<ListScreen> createState() => _ListScreenState();
}

class _ListScreenState extends State<ListScreen> {
  final format = DateFormat('EEEE, MMMM, d');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Wasteagram - $wastedItemsCount'),
      ),
      floatingActionButton: const CameraFab(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection('posts')
            .orderBy('date', descending: false)
            .snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasData &&
              snapshot.data!.docs != null &&
              snapshot.data!.docs.isNotEmpty) {
            return WasteListColumn(snapshot: snapshot);
          } else {
            return const CircularProgressColumn();
          }
        },
      ),
    );
  }
}
