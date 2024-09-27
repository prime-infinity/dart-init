void main() {
  var noodles = MenuItem("veg noodles", 9.99);
  var pizza = MenuItem("volcano pizza", 12.99);

  //print(noodles.format());
  //print(pizza.format());

  var mush_pizza = Pizza(["mushrooms", "pineapple"], "mushpizza", 15.99);
  var volcan_pizza = Pizza(["pepper, soup"], "volano_pizza", 16.00);
  print(mush_pizza.format());
  print(volcan_pizza.format());
}

class MenuItem {
  String title;
  double price;

  MenuItem(this.title, this.price); //acts as a constructor

  //method
  String format() {
    return '$title --> $price'; //note that "this" is not used
  }
}

//a child class that extends the parent class
class Pizza extends MenuItem {
  List<String> toppings;

  Pizza(this.toppings, super.title, super.price); //init the super vars

  //method overriding
  @override
  String format() {
    var formattedToppings = "Contains:";
    for (final t in toppings) {
      formattedToppings = '$formattedToppings $t';
    }
    return '$title -> $price \n$formattedToppings';
  }
}
