import 'package:flutter/material.dart';
import 'package:wasteagram/models/food_waste_post.dart';
import 'package:wasteagram/widgets/detail_column.dart';

class DetailScreen extends StatelessWidget {
  final FoodWastePost postObject;
  const DetailScreen({
    Key? key,
    required this.postObject,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Wasteagram'),
        leading: Semantics(
          onTapHint: 'Navigate Back to the Main List',
          child: const BackButton(),
        ),
      ),
      body: DetailColumn(
        postObject: postObject,
      ),
    );
  }
}
