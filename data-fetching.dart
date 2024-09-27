import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

void main() async {
  final post = await fetchPost();
  print(post.title);
  print(post.userId);

  fetchPost().then((p) {
    print(p.title);
    print(p.userId);
  });
}

Future<Post> fetchPost() async {
  var url = Uri.https('jsonplaceholder.typicode.com', '/posts/1');
  final response = await http.get(url);
  //print(response.body);
  Map<String, dynamic> data = convert.jsonDecode(response.body);

  return Post(data["title"], data["userId"]);
}

class Post {
  String title;
  int userId;
  Post(this.title, this.userId);
}
