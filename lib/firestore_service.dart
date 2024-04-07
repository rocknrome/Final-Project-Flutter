import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> addDocument() async {
    await _firestore.collection('your_collection_name').add({
      'field1': 'value1',
      'field2': 'value2',
      // Add other fields as needed
    });
  }

  // You can add more methods here for reading, updating, and deleting documents
}
