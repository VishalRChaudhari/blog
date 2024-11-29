import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:zarity_project/models/blog.dart';

class FirebaseServices {
  final FirebaseFirestore _firebase = FirebaseFirestore.instance;

  Future<List<Blog>> fetchdata() async {
    try {
      final snapshot = await _firebase.collection('blogs').get();
      return snapshot.docs.map(
        (docs) {
          return Blog.fromFirestore(docs.data());
        },
      ).toList();
    } on FirebaseException catch (e) {
      throw Exception('Failed to fetch data: $e');
    }
  }
}
