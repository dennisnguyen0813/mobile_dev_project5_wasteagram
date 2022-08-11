import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../models/food_waste_post.dart';
import 'package:location/location.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:wasteagram/widgets/new_post_widgets.dart';

class NewPostScreen extends StatefulWidget {
  const NewPostScreen({Key? key}) : super(key: key);

  @override
  State<NewPostScreen> createState() => _NewPostScreenState();
}

class _NewPostScreenState extends State<NewPostScreen> {
  File? image;
  final picker = ImagePicker();
  LocationData? locationData;
  String? fireStoreURL;
  final formKey = GlobalKey<FormState>();
  final foodWastePost = FoodWastePost();

  // pick an image from the gallery, upload it to Firebase storage
  // and return the URL of the image in Firebase Storage
  Future getImageURL() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    image = File(pickedFile!.path);
    var fileName = '${DateTime.now()}.jpg';
    Reference storageReference = FirebaseStorage.instance.ref().child(fileName);
    UploadTask uploadTask = storageReference.putFile(image!);
    await uploadTask;
    fireStoreURL = await storageReference.getDownloadURL();
  }

  Future retrieveLocation() async {
    var locationService = Location();
    locationData = await locationService.getLocation();
    // setState(() {});
  }

  @override
  void initState() {
    super.initState();
    initializeLocationAndImageURL();
  }

// async function
  void initializeLocationAndImageURL() async {
    await retrieveLocation();
    await getImageURL();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    if (image == null) {
      return const Center(child: CircularProgressIndicator());
    } else {
      return Scaffold(
        appBar: AppBar(title: const Text('New Waste Post')),
        body: Center(
          child: ImageColumn(
            fireStoreURL: fireStoreURL,
            foodWastePost: foodWastePost,
            formKey: formKey,
            image: image,
            locationData: locationData!,
          ),
        ),
        bottomNavigationBar: NewPostSaver(
          foodWastePost: foodWastePost,
          formKey: formKey,
          fireStoreURL: fireStoreURL,
        ),
      );
    }
  }
}
