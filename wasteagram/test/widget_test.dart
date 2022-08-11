import 'package:flutter_test/flutter_test.dart';
import 'package:wasteagram/models/food_waste_post.dart';

void main() {
  test('Post created from Map should have appropriate property values', () {
    final date = DateTime.parse('2022-01-01').toString();
    const url = 'Fake';
    const quantity = 2;
    const latitude = 1;
    const longitude = 30;
    final foodWastePost = FoodWastePost.fromMap({
      'date': date,
      'imageURL': url,
      'quantity': quantity,
      'latitude': latitude,
      'longitude': longitude,
    });

    expect(foodWastePost.date, date);
    expect(foodWastePost.imageURL, url);
    expect(foodWastePost.quantity, quantity);
    expect(foodWastePost.latitude, latitude);
    expect(foodWastePost.longitude, longitude);
  });

  test('Post created from Map should have nonnegative int property values', () {
    final date = DateTime.parse('2022-01-01').toString();
    const url = 'AnotherFake';
    const quantity = 20;
    const latitude = 15;
    const longitude = 3770;
    final foodWastePost = FoodWastePost.fromMap({
      'date': date,
      'imageURL': url,
      'quantity': quantity,
      'latitude': latitude,
      'longitude': longitude,
    });

    expect(foodWastePost.date, date);
    expect(foodWastePost.imageURL, url);
    expect(foodWastePost.quantity, isNonNegative);
    expect(foodWastePost.latitude, isPositive);
    expect(foodWastePost.longitude, isPositive);
  });
}
