void main() {
  var planets = {}; //creates an empty map, not an empty set

  Map<int, String> planets_solar = {
    1: "mecury",
    2: "venus",
    3: "earth",
    4: "mars",
    5: "jupiter"
  };

  print(planets_solar);
  print(planets_solar[3]); //earth, keyname, not index position\
  planets_solar[3] = "prime"; //change a value
  planets_solar[6] = "uranus"; //add to end

  //methods
  planets_solar.containsKey("uranus"); //check if a key is avail
  planets_solar.remove(3); //removes with a key
}
