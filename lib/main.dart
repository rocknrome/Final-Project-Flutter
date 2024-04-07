import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import './firestore_service.dart';

void main() async {
  WidgetsFlutterBinding
      .ensureInitialized(); // Ensure plugin services are initialized
  await Firebase.initializeApp(
    options: const FirebaseOptions(
        apiKey: "AIzaSyAHnujk7gFv0ln_bHKWwO5FksCL_xqDV7A", // Use your apiKey
        authDomain: "rnr-car-club.firebaseapp.com", // Use your authDomain
        projectId: "rnr-car-club", // Use your projectId
        storageBucket: "rnr-car-club.appspot.com", // Use your storageBucket
        messagingSenderId: "766735246500", // Use your messagingSenderId
        appId: "1:766735246500:web:5a7ba925dee0b51e3df231", // Use your appId
        measurementId: "G-RDMV30HF5W" // Optional and used only for analytics
        ),
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key}); // Added a Key parameter

  final FirestoreService _firestoreService = FirestoreService();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Firestore Example'),
        ),
        body: Center(
          child: ElevatedButton(
            onPressed: () {
              _firestoreService.addDocument();
            },
            child: const Text('Add Document'),
          ),
        ),
      ),
    );
  }
}
