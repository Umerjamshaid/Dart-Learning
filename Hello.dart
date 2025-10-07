// A simple Dart program to demonstrate functions and printing to console.
// File: Hello.dart
// Function to calculate the square of a number Part 1

int square(int n) {
  return n * n;
}

Square(z) {
  return z * z;
}

Circle(r) => 3.14 * r * r;

// Part 2: Functions as Objects and Printing to Console

String greet(String name) {
  return 'Hello, $name!';
}

// Assigning function to a variable
var fn = greet;

String FirstName(String name) => 'sup, $name';
var fn2 = FirstName;

// 3 Write a function apply(Function f, int x) that takes another function and an int, applies it, and prints result. Test it with square.

void apply(Function f, int x) {
  var result = f(x); // Apply the function f to x
  print(result); // Print the result
}

//PART 3 : Anonymous Functions
var numList = [1, 2, 3, 4, 5];

//🔹 Part 4: Callable Objects
class Multiplier {
  int factor;

  Multiplier(this.factor);

  int call(int x) {
    return x * factor;
  }
}

// 🔹 Part 5: Higher-Order Functions Exercise

operate(int a, int b, Function op) {
  return op(a, b);
}

void main() {
  print(square(5));
  print(Square(6));
  print(Circle(7));
  print(fn("umer"));
  print(fn2("hamdan"));
  apply(square, 10);
  // Testing with Circle function, This works because now you’re passing a function (n) => Circle(n).toInt() that matches the apply(Function f, int x) signature.
  // We convert the result to int for printing since Circle returns a double.
  //Lesson learned:
  // Functions return values. Circle(10) returns a number, not a function.
  // If apply needs a function, you must wrap logic inside a function and pass it in.
  apply((n) => Circle(n).toInt(), 7); // Converting to int for printing

  numList.forEach((List) {
    print('The number is $List');
  });

  var doubleIt = Multiplier(3);
  print(doubleIt(10));

  print(operate(1, 4, (a, b) => a + b));

  print("Hello, World!");
  // This is a simple Dart program that prints "Hello, World!" to the console.
}
