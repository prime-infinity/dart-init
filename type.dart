void main() {
  //explicit type annotations

  String name = "prime";
  int age = 45;
  bool isOpen = true;
  double averageRating = 9.9;

  const String last_name = "universe";

  //normally, we would declare a variable and it's type, but not give it a
  //value right away

  int? point; //by adding the "?" we allow a nullable value

  print('$name, $age, $isOpen, $averageRating, $last_name, $point');
}
