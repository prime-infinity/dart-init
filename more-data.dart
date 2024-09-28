void main() {
  //we explore other data structures
  //lists are like arrays in javascript
  var scores = [50, 12, 51, 53]; //list of integers, inferred by dart

  //scores = [23,42, "number"];// this will give an error

  List<int> new_scores = [1, 2, 3, 4]; //list of integers
  print(new_scores);

  print(new_scores[2]); //access one element with index
  new_scores[2] = 12; //lists are mutable
  print(new_scores[2]);

  new_scores.add(5); //add a value to end of list
  new_scores.remove(3); //removes a value by its....value
  new_scores.removeAt(2); //removes a value by its index

  print(new_scores.length);

  //we can also use something like a spread operator in js
  // Spread operator
  var moreNumbers = [...scores, 6, 7, 8];

  //we can also map
  var doubledNumbers = scores.map((s) => s * 2);
}
