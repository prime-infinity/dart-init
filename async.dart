void main() async {
  //Futures --> like promises in javascript
  //can have uncompleted or completed state

  fetchPost().then((p) {
    print(p.title);
    print(p.userId);
  });

  //using async/await
  final post = await fetchPost();
  print(post.title);
  print(post.userId);
}

Future<Post> fetchPost() {
  const delay = Duration(seconds: 3);

  return Future.delayed(delay, () {
    return Post("my first post", 123);
  });
}

class Post {
  String title;
  int userId;
  Post(this.title, this.userId);
}
