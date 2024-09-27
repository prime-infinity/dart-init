void main() {
  List<int> scores = [43, 643, 8, 32, 78, 53];
  for (int i = 0; i < scores.length; i++) {
    //print(i);
    //print(scores[i]);
  }

  //loop through a list
  for (int score in scores) {
    if (score > 50) {
      print('the score $score is greater tha 50');
    }
  }

  for (int score in scores.where((s) => s > 50)) {
    //similar to filter in JS
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
