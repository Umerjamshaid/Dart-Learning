import 'dart:io';

void main() {
  // ⚙️ LEVEL 1 — Logic & Loops (Basics)

  // Use loops, conditions, and variables.

  // FizzBuzz Classic
  // Print numbers 1–100, but:

  // Print "Fizz" for multiples of 3.

  // Print "Buzz" for multiples of 5.

  // Print "FizzBuzz" for both.

  // for (var i = 1; i <= 10; i++) {
  //   if (i % 3 == 0) {
  //     print("fizz");
  //   } else {
  //     print(i);
  //   }
  // }
  // String? divid = "-------------------------------------------------";
  // print(divid);

  // for (var r = 1; r <= 20; r++) {
  //   if (r % 5 == 0) {
  //     print("buzz");
  //   } else {
  //     print(r);
  //   }
  // }

  // String? divide = "-------------------------------------------------";
  // print(divide);

  // for (var z = 1; z <= 100; z++) {
  //   if (z % 3 == 0 && z % 5 == 0) {
  //     print("fizzbuzz");
  //   } else if (z % 5 == 0) {
  //     print("buzz");
  //   } else if (z % 3 == 0) {
  //     print("fizz");
  //   } else {
  //     print(z);
  //   }
  // }

  String? divide = "-------------------------------------------------";
  print(divide);

  //   Find Even & Odd Numbers
  // Take a number input from the user and print all even and odd numbers up to it.
  // print("Enter a number:");
  // String? input = stdin.readLineSync();
  // int number = int.parse(input!);

  // print("Even and odd numbers up to $number:");
  // for (var i = 1; i <= number; i++) {
  //   if (i % 2 == 0) {
  //     print("$i Is Even Number");
  //   } else {
  //     print("$i Is Odd Number");
  //   }
  // }

  // Todos  Simple Calculator
  // Ask the user for two numbers and an operation (+, -, *, /).
  // Use if/else logic to perform it and print the result.

  print("Enter Two numbers and your opration");

  String? input1 = stdin.readLineSync();
  int num1 = int.parse(input1!);

  String? input2 = stdin.readLineSync();
  int num2 = int.parse(input2!);

  String? operation = stdin.readLineSync();
  int result = 0;

  if (operation == "+") {
    result = num1 + num2;
  } else if (operation == "-") {
    result = num1 - num2;
  } else if (operation == "*") {
    result = num1 * num2;
  } else if (operation == "/") {
    if (num2 == 0) {
      print("Cannot divide by zero!");
    }
    result = num1 ~/ num2;
  } else {
    print("Invalid operation. Please use +, -, *, or /");
    return;
  }
  print("the result is $result");
}
