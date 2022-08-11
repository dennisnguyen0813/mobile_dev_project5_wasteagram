import 'package:flutter/material.dart';
import 'package:wasteagram/models/food_waste_post.dart';

class DetailColumn extends StatelessWidget {
  final FoodWastePost postObject;
  const DetailColumn({
    Key? key,
    required this.postObject,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Date of the waste post
        Padding(
          padding: const EdgeInsets.only(top: 35.0, bottom: 35.0),
          child: Text(
            postObject.date.toString(),
            style: Theme.of(context).textTheme.headline6,
          ),
        ),
        const SizedBoxColumn(),
        // image of the post
        Expanded(child: Image.network(postObject.imageURL.toString())),
        // quantity of the items
        Padding(
          padding: const EdgeInsets.all(35.0),
          child: Text('${postObject.quantity.toString()} items',
              style: Theme.of(context).textTheme.headline4),
        ),
        // location of food waste post
        Padding(
          padding: const EdgeInsets.only(top: 25.0),
          child: Text(
              'Location: (${postObject.longitude.toString()}, ${postObject.latitude.toString()})',
              style: Theme.of(context).textTheme.headline5),
        ),
      ],
    );
  }
}

class SizedBoxColumn extends StatelessWidget {
  const SizedBoxColumn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: const [
        Center(
          child: SizedBox(
            height: 20,
          ),
        )
      ],
    );
  }
}
