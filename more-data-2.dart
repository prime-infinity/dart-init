void main() {
  //we explore sets, sets should be familiar, i.e lists without dups
  var names = {"mario", "luigi", "peach"}; //set of string/inferred
  Set<String> new_names = {"rex", "terra", "phil"};
  Set<int> numbers = {
    2,
    4,
    1,
    4,
    5,
    2,
    4,
    6
  }; // this will have a warning cus we have dups

  print(new_names);
  print(numbers); //on printing, we see that dups have been auto removed

  numbers.add(10); //same functions as lists
  print(numbers);
}
