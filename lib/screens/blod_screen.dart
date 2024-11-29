import 'package:flutter/material.dart';
import 'package:zarity_project/models/blog.dart';
import 'package:zarity_project/services/firebase_services.dart';

class BlogTab extends StatelessWidget {
  BlogTab({super.key});

  final FirebaseServices firebaseservices = FirebaseServices();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Blogs'),
      ),
      body: FutureBuilder<List<Blog>>(
        future: firebaseservices.fetchdata(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('No Blogs available'));
          }
          final blogs = snapshot.data!;
          return ListView.builder(
            itemCount: blogs.length,
            itemBuilder: (context, index) {
              final blog = blogs[index];
              return ExpansionTile(title: Text(blog.title));
            },
          );
        },
      ),
    );
  }
}
