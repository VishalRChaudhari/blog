class Blog {
  Blog({
    required this.title,
    required this.deeplink,
    required this.imageUrl,
    required this.summary,
    required this.content,
  });
  String title;
  String deeplink;
  String imageUrl;
  String summary;
  String content;

  factory Blog.fromFirestore(Map<String, dynamic> data) {
    return Blog(
      title: data['title'],
      deeplink: data['deeplink'],
      imageUrl: data['imageurl'],
      summary: data['summary'],
      content: data['content'],
    );
  }
}
