void main() {
  //creating variables
  var name = "prime"; //this typed is inferred
  print('my name is $name');

  final age = 24; //final variable cannot be changed, use at runtime vars

  const isOpen = true; //use at compile time vars
  print('$age $isOpen');
}
