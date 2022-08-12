import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// needed for firestore, location, and internationalization services
import 'package:location/location.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:intl/intl.dart';
import 'package:firebase_analytics/firebase_analytics.dart';

// needed to import assorted widgets required below
import 'package:wasteagram/widgets/waste_form.dart';
import 'package:wasteagram/screens/list_screen.dart';
import '../models/food_waste_post.dart';

// column of new post screens that contains selected image
// and input form
class ImageColumn extends StatelessWidget {
  final File? image;
  final String? fireStoreURL;
  final GlobalKey<FormState> formKey;
  final LocationData locationData;
  final FoodWastePost foodWastePost;

  const ImageColumn({
    Key? key,
    required this.fireStoreURL,
    required this.foodWastePost,
    required this.formKey,
    required this.image,
    required this.locationData,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(child: Image.file(image!)),
        Center(
          child: WasteForm(
            formKey: formKey,
            locationData: locationData,
            postObject: foodWastePost,
            fireStoreUrl: fireStoreURL!,
          ),
        )
      ],
    );
  }
}

// bottom nav bar of new post screen that saves post
// to firestore then pops back to the main list screen
class NewPostSaver extends StatelessWidget {
  final FoodWastePost foodWastePost;
  final GlobalKey<FormState> formKey;
  final String? fireStoreURL;

  final FirebaseAnalyticsObserver observer;
  final FirebaseAnalytics analytics;

  const NewPostSaver(
      {Key? key,
      required this.foodWastePost,
      required this.formKey,
      required this.fireStoreURL,
      required this.analytics,
      required this.observer})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final format = DateFormat('EEEE, MMMM d, y');
    return Semantics(
      onTapHint: 'Uploads new post to cloud storage',
      label: 'Post Uploader',
      // bottom nav bar container to click
      child: GestureDetector(
        child: Container(
          color: Colors.purple,
          height: 100,
          child: const Icon(Icons.cloud_upload, color: Colors.blue, size: 60),
        ),
        onTap: () async {
          foodWastePost.date = format.format(DateTime.now());
          if (formKey.currentState!.validate()) {
            formKey.currentState!.save();
            FirebaseFirestore.instance.collection('posts').add(
              {
                'date': foodWastePost.date,
                'imageURL': fireStoreURL,
                'latitude': foodWastePost.latitude,
                'longitude': foodWastePost.longitude,
                'quantity': foodWastePost.quantity,
              },
            );
            // return to the main list screen after data uploaded to firebase
            // Navigator.of(context).pop();
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => ListScreen(
                  observer: observer,
                  analytics: analytics,
                ),
              ),
            );
          }
        },
      ),
    );
  }
}
