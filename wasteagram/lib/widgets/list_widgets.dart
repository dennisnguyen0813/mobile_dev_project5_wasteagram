import 'package:flutter/material.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';

import 'package:wasteagram/screens/detail_screen.dart';
import 'package:wasteagram/models/food_waste_post.dart';

class WasteListColumn extends StatelessWidget {
  final AsyncSnapshot<QuerySnapshot> snapshot;
  const WasteListColumn({
    Key? key,
    required this.snapshot,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: ListView.builder(
            itemCount: snapshot.data!.docs.length,
            itemBuilder: (BuildContext context, int index) {
              final post = snapshot.data!.docs[index];
              final postObject = FoodWastePost(
                date: post['date'],
                imageURL: post['imageURL'],
                latitude: post['latitude'],
                longitude: post['longitude'],
                quantity: post['quantity'],
              );
              return SemanticListTile(
                post: post,
                postObject: postObject,
              );
            },
          ),
        )
      ],
    );
  }
}

// return List Tile wrapped in Semantic Widget for main list screen
class SemanticListTile extends StatelessWidget {
  final QueryDocumentSnapshot<Object?> post;
  final FoodWastePost postObject;
  const SemanticListTile({
    Key? key,
    required this.post,
    required this.postObject,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Semantics(
      onTapHint: 'View Waste Post Details',
      label: 'Waste Post Details',
      enabled: true,
      child: ListTile(
        // main text field is the date followed by the quantity
        // tapping the List Tile navigates to the details screen for that post
        title: Text(
          post['date'].toString(),
          style: Theme.of(context).textTheme.headline5,
        ),
        trailing: Text(
          post['quantity'].toString(),
          style: Theme.of(context).textTheme.headline5,
        ),
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => DetailScreen(
                postObject: postObject,
              ),
            ),
          );
        },
      ),
    );
  }
}
