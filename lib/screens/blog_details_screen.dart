import 'package:flutter/material.dart';
import 'package:zarity_project/models/blog.dart';

class BlogDetailsScreen extends StatelessWidget {
  const BlogDetailsScreen({super.key, required this.blog});

  final Blog blog;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          //actions -> deeplink
          actions: [
            TextButton(onPressed: (){}, child: const Text('Read More'))
          ],
          ),
      body: Expanded(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              Text(
                blog.title,
                style:
                    const TextStyle(fontSize: 21, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 15,
              ),
              //image
              Image.network(
                blog.imageUrl,
              ),
              const SizedBox(
                height: 20,
              ),
              //content
              Text(blog.content),
            ],
          ),
        ),
      ),
    );
  }
}
