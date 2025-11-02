void main() {
  // logic - if, if/Else, if else if
  var num = 52;
  //> < >= <= !=
  if (num <= 6) {
    print("number is '5'");
  } else if (num == 3) {
    print("The number is 3");
  } else
    print("the number is not 5 or 3 it is $num");
}



// Dart offers a set of comparison operators, also known as relational operators, which are used to compare two values and produce a boolean result (true or false).
// Here are the comparison operators in Dart:
// Equal to (==): Checks if two operands are equal.
// Code

//     void main() {
//       int a = 5;
//       int b = 5;
//       print(a == b); // true
//     }
// Not equal to (!=): Checks if two operands are not equal.
// Code

//     void main() {
//       int a = 5;
//       int b = 10;
//       print(a != b); // true
//     }
// Greater than (>): Checks if the left operand is greater than the right operand.
// Code

//     void main() {
//       int a = 10;
//       int b = 5;
//       print(a > b); // true
//     }
// Less than (<): Checks if the left operand is less than the right operand.
// Code

//     void main() {
//       int a = 5;
//       int b = 10;
//       print(a < b); // true
//     }
// Greater than or equal to (>=): Checks if the left operand is greater than or equal to the right operand.
// Code

//     void main() {
//       int a = 10;
//       int b = 10;
//       print(a >= b); // true
//     }
// Less than or equal to (<=): Checks if the left operand is less than or equal to the right operand.
// Code

//     void main() {
//       int a = 5;
//       int b = 10;
//       print(a <= b); // true
//     }
// Important Note on == for Objects:
// By default, the == operator for objects in Dart checks for identity (whether two variables refer to the exact same object in memory). If you need to compare objects based on their values (e.g., checking if two Person objects have the same name and age), you must override the == operator and also the hashCode getter in your custom class. Libraries like equatable can simplify this process.