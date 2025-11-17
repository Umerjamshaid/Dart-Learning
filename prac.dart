import 'dart:ffi';
import 'dart:io';

import 'dart-variables.dart';
import 'umer.dart';

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

  // print("Enter Two numbers and your opration");

  // String? input1 = stdin.readLineSync();
  // int num1 = int.parse(input1!);

  // String? input2 = stdin.readLineSync();
  // int num2 = int.parse(input2!);

  // String? operation = stdin.readLineSync();
  // int result = 0;

  // if (operation == "+") {
  //   result = num1 + num2;
  // } else if (operation == "-") {
  //   result = num1 - num2;
  // } else if (operation == "*") {
  //   result = num1 * num2;
  // } else if (operation == "/") {
  //   if (num2 == 0) {
  //     print("Cannot divide by zero!");
  //   }
  //   result = num1 ~/ num2;
  // } else {
  //   print("Invalid operation. Please use +, -, *, or /");
  //   return;
  // }
  // print("the result is $result");

  // Source - https://stackoverflow.com/questions/21521729/how-do-i-reverse-a-string-in-dart
  // Posted by Florian Loitsch
  // Retrieved 2025-11-06, License - CC BY-SA 3.0

  // one way to reverse a word or some
  // var input = '12314432'; // Amélie
  // print(new String.fromCharCodes(input.runes.toList().reversed)); // eiĺemA

  // doing it with loops

  // 1. Ask the user for a word
  //   stdout.write("Enter the Reversed word ");
  //   String? orginalWord = stdin.readLineSync();

  //   //Handle the null or empty press matter:
  //   if (orginalWord == null || orginalWord.isEmpty) {
  //     print("Nothing Was Submitted");
  //     return;
  //   }

  //   String reversedWord = reverseWithLoop(orginalWord);

  //   print("Orignal Word $orginalWord");
  //   print("Reversed Word $reversedWord");

  //   myfunc();
  // }

  // String reverseWithLoop(String word) {
  //   String reversed = "";
  //   int length = word.length;

  //   for (int i = length - 1; i >= 0; i--) {
  //     reversed += word[i];
  //   }
  //   return reversed;

  // -----------------------------------------------------------
  // 🧠 LEVEL 2 — Lists, Maps, and Loops Combined

  // Student Marks Manager

  // Take 3 students’ names and marks (store in a map).

  // Use a loop to print each student's name and mark.

  // Calculate and print the average.

  // If any student scored < 40 → print "Failed".

  var student = {"Umer": 30, "Usman": 50, "ali": 30};

  int total = 0;

  for (var entry in student.entries) {
    print('${entry.key}: ${entry.value}');
    total += entry.value; // sum marks
  }

  double avarage = total / student.length;
  print("\nAverage Marks: ${avarage.toStringAsFixed(2)}");

  print("\nResults");

  for (var entry in student.entries) {
    if (entry.value < 40) {
      print('${entry.value} → Failed');
    } else {
      print('${entry.key} → passed');
    }
  }
}

// void myfunc() {
//   stdout.write("Enter here");
//   String? orignalword = stdin.readLineSync();

//   if (orignalword == null || orignalword.isEmpty) {
//     print("Pls Enter the word !!");
//     return;
//   }

//   print("Enter orignal word $orignalword");
//   print("Enter reversed word ");
// }
