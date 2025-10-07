import 'dart:io';

var house = ['1st-floor', '2nd-floor', '3rd-floor', '4th-floor', '5th-floor'];

void main(List<String> options) {
  print('Hello World');
  // print('your floor is $house');
  // Prompt the user
  stdout.write("Enter your $house: ");
  // Read user input
  String? input = stdin.readLineSync();
  // Print the input
  if (house.contains(input)) {
    print(input);
  } else {
    print("Invalid floor");
  }
}

/// Displays a list of options and allows the user to select one.
/// Returns the selected item as a String, or null if the input is invalid.
String? selectOptionFromList(List<String> options) {
  print('Please choose a Floor :');
  for (int i = 0; i < options.length; i++) {
    print('${i + 1}. ${options[i]}');
  }

  stdout.write('Enter the number of your Floor: ');
  String? input = stdin.readLineSync();

  if (input == null || input.isEmpty) {
    print('No input provided.');
    return null;
  }

  try {
    int choice = int.parse(input);
    if (choice >= 1 && choice <= options.length) {
      return options[choice - 1]; // Adjust for 0-based indexing
    } else {
      print(
        'Invalid choice. Please enter a number between 1 and ${options.length}.',
      );
      return null;
    }
  } on FormatException {
    print('Invalid input. Please enter a number.');
    return null;
  }
}

void floor() {
  List<String> house = [
    '1st-floor',
    '2nd-floor',
    '3rd-floor',
    '4th-floor',
    '5th-floor',
  ];
  String? selectedFruit = selectOptionFromList(house);

  if (selectedFruit != null) {
    print('You selected: $selectedFruit');
  } else {
    print('No valid selection was made.');
  }
}
