void main() {
  final greeting = greet(name: "prime", age: 34); //now position does not matter
  print(greeting);
  final new_greeting = greet(age: 4);
  print(new_greeting);
}

String greet({String? name, required int age}) {
  //we use named parameters to mitigate the position effect of the parameters
  //we now have to explicitly mark the parameters as optional or required
  return "hi my name is $name, and i am $age years old";
}
