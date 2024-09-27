void main() {
  List<int> scores = [43, 643, 8, 32, 78, 53];
  for (int i = 0; i < scores.length; i++) {
    //print(i);
    //print(scores[i]);
  }

  //loop through a list
  for (int score in scores) {
    print(score);
  }

  List<String> names = ["osamede", "prime", "yondy"];

  for (String name in names) {
    print(name);
  }

  List<dynamic> options = [2, 3, "this", "ow", 4];

  for (dynamic option in options) {
    print(option);
  }
}
