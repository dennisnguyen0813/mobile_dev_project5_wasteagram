// pure dart model with factory fromMap method that turns
// Maps into FoodWastePost objects
class FoodWastePost {
  String? date;
  String? imageURL;
  double? latitude;
  double? longitude;
  int? quantity;

  FoodWastePost({
    this.date,
    this.imageURL,
    this.latitude,
    this.longitude,
    this.quantity,
  });

  factory FoodWastePost.fromMap(Map<String, dynamic> postMap) {
    return FoodWastePost(
      date: postMap['date'] as String,
      imageURL: postMap['imageURL'] as String,
      latitude: postMap['latitude'] as double,
      longitude: postMap['latitude'] as double,
      quantity: postMap['quantity'] as int,
    );
  }
}
