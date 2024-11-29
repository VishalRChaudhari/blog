import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zarity_project/providers/firebase_provider.dart';

class BlogDetailsScreen extends StatefulWidget {
  const BlogDetailsScreen({super.key});

  @override
  State<BlogDetailsScreen> createState() => _BlogDetailsScreenState();
}

class _BlogDetailsScreenState extends State<BlogDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    final firebaseProvider = Provider.of<FirebaseProvider>(context);
    if (firebaseProvider.data.isEmpty && !firebaseProvider.isLoading) {
      firebaseProvider.fetchData();
    }
    return Scaffold(
      appBar: AppBar(),
    );
  }
}
