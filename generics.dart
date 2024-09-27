void main() {
  var noodles = MenuItem("veg noodles", 9.99);
  var mush_pizza = Pizza(["mushrooms", "pineapple"], "mushpizza", 15.99);
  var roast = MenuItem("veggie roast dinner", 12.49);
  var kabab = MenuItem("plant kebab", 7.49);

  //sets type to MenuItem's type
  var foods =
      Collection<MenuItem>("menu items", [noodles, mush_pizza, roast, kabab]);

  var random = foods.randomItem();
  print(random);
}

class MenuItem {
  String title;
  double price;

  MenuItem(this.title, this.price); //acts as a constructor

  //method
  String format() {
    return '$title --> $price'; //note that "this" is not used
  }

  @override
  String toString() {
    return format();
  }
}

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

  @override
  String toString() {
    return 'Instance of Pizza: $title. $price. $toppings';
  }
}

//generic class captures the type it is instantiated with
class Collection<T> {
  String name;
  List<T> data;
  Collection(this.name, this.data);

  T randomItem() {
    data.shuffle();
    return data[0];
  }
}
