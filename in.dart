import 'dart:io';
import 'dart-variables.dart';

void main() {
  //user input
  print("Enter your name pls :");

  // Now allowing the users to enter thier name:
  var name = stdin.readLineSync();
  // but heres the thing, if we assign an intiger it will give us an error
  // or if we String name = stdin.readLineSync(); it will still give us error becuase the type string is not nullable but "String?" is.
  print("hello $name");

  // for example:
  print("lol :");
  String? names = stdin.readLineSync();
  // now it wont give you an error
  print("hello: $names");

  // --------------------------------

  myfunc(String name) {
    return "my city is $city";
  }

  var cities = myfunc("$city");
  String? y = stdin.readLineSync();
  print(y);
  print(cities);
}
