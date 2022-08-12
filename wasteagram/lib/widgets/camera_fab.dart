import 'package:flutter/material.dart';
import 'package:wasteagram/screens/new_post_screen.dart';
import 'package:firebase_analytics/firebase_analytics.dart';

// Floating Action Button that brings user
// to New Post Screen to Select an Image to upload
class CameraFab extends StatelessWidget {
  final FirebaseAnalyticsObserver observer;
  final FirebaseAnalytics analytics;
  const CameraFab({
    Key? key,
    required this.analytics,
    required this.observer,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Semantics(
      button: true,
      onTapHint: 'Button to Select an Image',
      label: 'Button for Camera',
      enabled: true,
      child: FloatingActionButton(
        onPressed: () async {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => NewPostScreen(
                analytics: analytics,
                observer: observer,
              ),
            ),
          );
        },
        child: const Icon(Icons.camera_alt),
      ),
    );
  }
}
