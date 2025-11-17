import 'dart:io'; // Required for user input (stdin)

void main() {
  // 1. Ask the user for a word
  stdout.write("Enter a word to reverse: ");
  String? originalWord = stdin.readLineSync();

  // Handle potential null input (if the user just presses enter)
  if (originalWord == null || originalWord.isEmpty) {
    print("No word entered.");
    return;
  }

  // 2. Reverse the word using a loop
  String reversedWord = reverseWithLoop(originalWord);

  // 3. Print the result
  print("Original word: $originalWord");
  print("Reversed word: $reversedWord");
}

String reverseWithLoop(String word) {
  String reversed = ""; // Initialize an empty string to build the reversed word
  int length = word.length;

  // Loop from the last character index down to the first (index 0)
  for (int i = length - 1; i >= 0; i--) {
    // Add the character at the current index 'i' to the end of the new string
    reversed += word[i];
  }

  return reversed;
}

// Perfect — this is how you actually **learn like a developer**, not a copy-paster. Let’s go through it **line by line**, no skipping. I’ll explain it like I’m teaching you face-to-face — clear, simple, and logical.

// ---

// ### 🧠 **Code: Reverse a String**

// ```dart
// import 'dart:io';
// ```

// 🔹 This imports the **I/O library** — `io` stands for *Input/Output*.
// It gives access to things like:

// * `stdin` → take input from the user (keyboard)
// * `stdout` → print/write to the console

// Without this, you can’t use `stdin.readLineSync()` or `stdout.write()`.

// ---

// ```dart
// void main() {
// ```

// 🔹 This is the **main function** — where every Dart program starts.
// When your app runs, Dart looks for this `main()` and executes what’s inside it.

// ---

// ```dart
//   stdout.write("Enter a word to reverse: ");
// ```

// 🔹 `stdout.write()` prints something on the screen **without adding a new line** (so the user types on the same line).
// If you used `print()`, it would go to the next line automatically.

// Example:

// ```
// stdout.write("Enter: "); → Enter: [cursor stays here]
// print("Enter: "); → Enter:
//                     [cursor below]
// ```

// ---

// ```dart
//   String? originalWord = stdin.readLineSync();
// ```

// 🔹 This **takes input from the user**.

// * `stdin.readLineSync()` reads what the user types and returns it as a **String?** (nullable string).
// * That’s why we write `String?` — because the user could press *Enter* without typing anything → result = `null`.

// So now, whatever the user typed (like `"hello"`) is stored inside the variable `originalWord`.

// ---

// ```dart
//   if (originalWord == null || originalWord.isEmpty) {
//     print("No word entered.");
//     return;
//   }
// ```

// 🔹 This checks if the user entered *nothing*.
// There are two checks:

// 1. `originalWord == null` → user pressed enter without typing.
// 2. `originalWord.isEmpty` → user typed but didn’t write any characters (like just spaces).

// If either is true, we show `"No word entered."` and then `return;` — which **stops** the program right there.

// ---

// ```dart
//   String reversedWord = reverseWithLoop(originalWord);
// ```

// 🔹 Here, we call another function named `reverseWithLoop()` and **pass** the user’s word to it.
// That function will do the reversing and **return** the reversed word.
// We store that result inside the variable `reversedWord`.

// Think of it like:

// > "Hey function, here’s my word. Reverse it and give it back."

// ---

// ```dart
//   print("Original word: $originalWord");
//   print("Reversed word: $reversedWord");
// ```

// 🔹 This just prints both — the original and reversed versions — for clarity.

// Example output:

// ```
// Original word: hello
// Reversed word: olleh
// ```

// ---

// ```dart
// String reverseWithLoop(String word) {
// ```

// 🔹 This defines a **function** named `reverseWithLoop` that takes one parameter `word` (the string we want to reverse).

// ---

// ```dart
//   String reversed = "";
// ```

// 🔹 This starts with an **empty string**.
// We’ll use this to build the reversed word **one character at a time**.

// ---

// ```dart
//   int length = word.length;
// ```

// 🔹 We get how many characters the word has.
// For example, if word = `"dart"`, then `length = 4`.

// ---

// ```dart
//   for (int i = length - 1; i >= 0; i--) {
// ```

// 🔹 This is a **for loop** that goes **backward** through the string.
// Let’s say `length = 4`, that means indices are:

// ```
// d  a  r  t
// 0  1  2  3
// ```

// So we start from index `3` (`t`) and go down to index `0` (`d`).

// This line says:

// * Start at `i = 3`
// * Keep looping while `i >= 0`
// * After each loop, `i--` (subtract 1)

// ---

// ```dart
//     reversed += word[i];
// ```

// 🔹 Inside the loop, we **add** the character at position `i` to the `reversed` string.

// Example:

// ```
// word = "dart"
// i = 3 → reversed = "" + "t" = "t"
// i = 2 → reversed = "t" + "r" = "tr"
// i = 1 → reversed = "tr" + "a" = "tra"
// i = 0 → reversed = "tra" + "d" = "trad"
// ```

// Now `reversed` = `"trad"` ✅

// ---

// ```dart
//   return reversed;
// }
// ```

// 🔹 After the loop finishes, we **return** the final reversed string back to where we called it (in main).

// ---

// ### ✅ Final Flow Summary:

// 1. Ask user for input
// 2. If empty, stop
// 3. Send the word to a function
// 4. Function loops backward through it
// 5. Builds a new reversed string
// 6. Returns it to main
// 7. Print the result

// ---

// If you want, I can make you a **visual version** (ASCII style) showing how `"dart"` turns into `"trad"` step-by-step through each loop iteration.
// Would you like that?
