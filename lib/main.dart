import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import './firestore_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: const FirebaseOptions(
      apiKey: "AIzaSyAHnujk7gFv0ln_bHKWwO5FksCL_xqDV7A",
      authDomain: "rnr-car-club.firebaseapp.com",
      projectId: "rnr-car-club",
      storageBucket: "rnr-car-club.appspot.com",
      messagingSenderId: "766735246500",
      appId: "1:766735246500:web:5a7ba925dee0b51e3df231",
      measurementId: "G-RDMV30HF5W",
    ),
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key}); // Added named key parameter

  final FirestoreService _firestoreService = FirestoreService();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Firestore Example'),
        ),
        body: Column(
          children: [
            ElevatedButton(
              onPressed: () {
                _firestoreService.addCar();
              },
              child: const Text('Add Car'),
            ),
            Expanded(
              child:
                  FutureBuilder<List<DocumentSnapshot<Map<String, dynamic>>>>(
                future: _firestoreService.fetchCars(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasError) {
                    return Text('Error: ${snapshot.error}');
                  } else if (snapshot.hasData) {
                    return ListView(
                      children: snapshot.data!.map((doc) {
                        final data = doc.data();
                        if (data != null) {
                          return ListTile(
                            title: Text(
                                "${data['make'] ?? ''} ${data['model'] ?? ''}"),
                            subtitle: Text(
                                'Year: ${data['year'] ?? ''} - Price: \$${data['price'] ?? ''}'),
                            leading: Image.network(data['photo_url'] ?? '',
                                width: 100, fit: BoxFit.cover),
                          );
                        } else {
                          return const SizedBox(); // Or handle null data in another way
                        }
                      }).toList(),
                    );
                  } else {
                    return const Text('No data');
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
