import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:location/location.dart';

import 'package:wasteagram/models/food_waste_post.dart';

class QuantityTextFormField extends StatelessWidget {
  final String fireStoreUrl;
  final FoodWastePost postObject;
  final LocationData locationData;

  const QuantityTextFormField(
      {Key? key,
      required this.postObject,
      required this.locationData,
      required this.fireStoreUrl})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      textAlign: TextAlign.center,
      keyboardType: TextInputType.number,
      inputFormatters: [
        FilteringTextInputFormatter.digitsOnly,
      ],
      style: Theme.of(context).textTheme.headline6,
      decoration: const InputDecoration(
        hintText: 'Wasted Items Quantity',
      ),
      validator: (input) {
        if (input!.isEmpty) {
          return "Please input a number for quantity of wasted items";
        } else {
          return null;
        }
      },
      onSaved: (input) {
        postObject.quantity = int.parse(input!);
        postObject.imageURL = fireStoreUrl;
        postObject.longitude = locationData.longitude as double;
        postObject.latitude = locationData.latitude as double;
      },
    );
  }
}
