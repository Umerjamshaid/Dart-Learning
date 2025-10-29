void main() {
  // todo: Maps! Key/Value pairs
  var toppings = {
    "John": "Chikken tikka",
    "umer": "Cheese",
    "usman": "Pepporni",
  };
  print(toppings);
  print(toppings["John"]);

  // Show Value
  print(toppings.values);
  //Show Keys
  print(toppings.keys);
  //Shows length
  print(toppings.length);

  //Add Somthings
  toppings["tim"] = "Tikka";
  print(toppings);

  // Add many things
  toppings.addAll({"Tina": "Susage", "Ali": "Cheezy", "hamdan": "Chocolate"});
  print(toppings);

  // Remove things
  toppings.remove("umer");
  print(toppings);

  //  Clear everything
  toppings.clear();
  print(toppings);
}
