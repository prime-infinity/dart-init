void main() {
  final greeting = greet("prime", 34);
  print(greeting);
}

//we add a type annotation before a function name to say
//what kinda data we would be expecting as a return

String greet(String name, int age) {
  //we can type arguements too
  return "hi my name is $name, and i am $age years old";
}
