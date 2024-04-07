import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> addCar() async {
    await _firestore.collection('cars').add({
      'id': 'D7w44AwVohB4LnVTSnLc',
      'make': 'Toyota',
      'model': 'Corolla',
      'color': 'Blue',
      'year': 2021,
      'mileage': 18000,
      'price': 24000,
      'description': 'Reliable everyday commuter',
      'photo_url':
          'https://live.staticflickr.com/65535/53632512847_071816a4c2.jpg',
    });
  }

  Future<List<DocumentSnapshot<Map<String, dynamic>>>> fetchCars() async {
    var querySnapshot = await _firestore.collection('cars').get();
    return querySnapshot.docs;
  }
}
