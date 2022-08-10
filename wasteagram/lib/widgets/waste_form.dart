import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:location/location.dart';

import 'package:wasteagram/models/food_waste_post.dart';
import 'package:wasteagram/widgets/form_text_field.dart';

// form used by new_post_screen to upload
// location, image file, image url, quantity wasted
class WasteForm extends StatelessWidget {
  final GlobalKey<FormState> formKey;
  final FoodWastePost postObject;
  final String fireStoreUrl;
  final LocationData locationData;

  const WasteForm({
    Key? key,
    required this.formKey,
    required this.postObject,
    required this.fireStoreUrl,
    required this.locationData,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Padding(
        padding: const EdgeInsets.only(left: 20.0, right: 20.0),
        child: Semantics(
          onTapHint: 'Form to enter the number of food items wasted',
          label: 'Form to enter the waste quantity',
          child: QuantityTextFormField(
            postObject: postObject,
            locationData: locationData,
            fireStoreUrl: fireStoreUrl,
          ),
        ),
      ),
    );
  }
}
