import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:zarity_project/providers/firebase_provider.dart';

class BlogTab extends StatelessWidget {
  const BlogTab({super.key});

  @override
  Widget build(BuildContext context) {
    final firebaseProvider = Provider.of<FirebaseProvider>(context);
    if (firebaseProvider.data.isEmpty && !firebaseProvider.isLoading) {
      firebaseProvider.fetchData();
    }

    return Scaffold(
      appBar: AppBar(
        elevation: 10,
        title: const Text('Blogs'),
      ),
      body: firebaseProvider.isLoading
          ? const Center(child: CircularProgressIndicator())
          : firebaseProvider.errorMessage != null
              ? Center(child: Text(firebaseProvider.errorMessage!))
              : ListView.separated(
                  separatorBuilder: (context, index) => const SizedBox(
                    height: 10,
                  ),
                  itemCount: firebaseProvider.data.length,
                  itemBuilder: (context, index) {
                    final blog = firebaseProvider.data[index];
                    return ExpansionTile(
                      trailing: IconButton(onPressed: (){

                      }, icon: const Icon(Icons.navigate_next)),
                      showTrailingIcon: true,
                      childrenPadding:const EdgeInsets.only(
                              left: 14, bottom: 8,right: 7), 
                      title: Text(blog.title),
                      children: [
                         Divider(
                           color: Colors.grey[400],
                           thickness: 0.5,
                         ),
                        Text(blog.summary),
                      ],
                    );
                  },
                ),
    );
  }
}
/*
ListView.builder(
        itemCount: firebaseProvider.data.length,
        itemBuilder: (context, index) {
          final blog = firebaseProvider.data[index];
          return ExpansionTile(title: Text(blog.title));
        },
      ),

 FutureBuilder<List<Blog>>(
        future: FirebaseProvider().fetchData(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('No Blogs available'));
          }
          final blogs = firebaseProvider.data;
          return ListView.builder(
            itemCount: blogs.length,
            itemBuilder: (context, index) {
              final blog = blogs[index];
              return ExpansionTile(title: Text(blog.title));
            },
          );
        },
      ),
      */