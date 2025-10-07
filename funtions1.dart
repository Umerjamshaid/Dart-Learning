// void main() {
//   print(getMessage(true));
//   print(getMassage(false));
//   print(calculateArea(1.3, 3.3));
//   print(finMax(1067, 2033, 332));
// }

// /// Function to return a greeting message based on the time of day
// String getMessage(bool isMorning) {
//   if (isMorning) {
//     return 'Good Morning!';
//   } else {
//     return 'Good Nigth!';
//   }
// }

// String getMassage(bool ismorning) =>
//     ismorning ? 'Good Morning!' : 'Good Night!';

// /// Function to calculate the area of a rectangle // width * height
// double calculateArea(double width, double height) {
//   return width * height;
// }

// // Function to find the maximum of three numbers
// finMax(int a, int b, int c) {
//   if (a >= b && a >= c) {
//     return a;
//   } else if (b >= a && b >= c) {
//     return b;
//   } else {
//     return c;
//   }
// }

void main() {
  print(getMessage(true));
  print(areaCalculate(2.2, 2.4));
  print(ifMax(322344, 31234, 32234));
  print(greetUser('jamshaid', 'umer'));
  print(Greetuser("Hamdan", "Dr."));
  print(registerUser(name: "umer", Age: 12));
  print(operateList([1, 2, 3], (n) => n * 2));
  print(
    filterList([
      2,
      5,
      5,
      67,
      867,
      123,
      456,
      978,
      2,
      5,
      6,
      7,
      8,
      9,
      10,
      11,
      12,
      13,
      14,
      13412234,
      435,
    ], (n) => n.isOdd),
  );
}

//TODO: Function to return a greeting message based on the time of day
String getMessage(bool isMorning) {
  if (isMorning) {
    return 'Good Morning!';
  } else {
    return 'Good Night!';
  }
}

// Function to calculate the area of a rectangle // width * height
areaCalculate(double width, double height) {
  return width * height;
}

//  Function to find the maximum of three numbers

ifMax(int a, int b, int c) {
  if (a >= b && a >= c) {
    return a;
  } else if (b >= a && b >= c) {
    return b;
  } else {
    return c;
  }
}

greetUser(String name, [String title = ""]) {
  if (title.isNotEmpty) {
    return '$title' + '$name';
  } else {
    return '$name';
  }
}

String Greetuser(String name, [String title = ""]) =>
    title.isNotEmpty ? '$title' + '$name' : '$name';

registerUser({String name = "Guest User", int Age = 18}) {
  return 'Your name is: $name and your age is: $Age';
}

List<int> operateList(List<int> numbers, int Function(int) operation) {
  List<int> results = [];
  for (int n in numbers) {
    results.add(operation(n));
  }
  return results;
}

List<int> filterList(List<int> numbers, bool Function(int) condition) {
  List<int> results = [];
  for (int n in numbers) {
    if (condition(n)) {
      results.add(n);
    }
  }
  return results;
}
