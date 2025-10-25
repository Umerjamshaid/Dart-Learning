// Variable declaration in Dart
// string variable
var name = "Xing ping";

String city = "Beijing";

//integer variable
var age = 30;

int year = 2024;

// dynamic variable and what they can do:
// dynamic variable can change type
// dynamic variable = "I am a string";
//variable = 100; // now it's an integer
//variable = true; // now it's a boolean
//variable = 45.67; // now it's a double
//variable = [1, 2, 3]; // now it's a list
//variable = {"key": "value"}; // now it's a map
//variable = null; // now it's null
//variable = (x) => x * 2; // now it's a function
//variable = DateTime.now(); // now it's a DateTime object
//variable = RegExp(r'^[a-zA-Z]+$'); // now it's a RegExp object
//variable = Uri.parse("https://example.com"); // now it's a Uri object
//variable = Duration(seconds: 5); // now it's a Duration object

// -----
// 🧒 Imagine You’re 10:

// Think of dynamic like a magic box.
// You can put anything in it — a toy car, a candy, a book — and Dart won’t complain.
// But when you take something out, Dart won’t know what’s inside, so if you try to use it wrong, it can break.

// Example:

// dynamic box = "Hello";
// print(box); // Works fine

// box = 123; // Also fine — it changed from String to int

// print(box + 2); // Works now because box is int

// But if you do:

// dynamic box = "Hello";
// print(box + 2); // CRASH! Because "Hello" + 2 doesn’t make sense

// Dart doesn’t catch that mistake until runtime (when the app is actually running).

// 👴 Imagine You’re 100:

// Back in your day, programming languages were strict.
// If you said “this variable is a number,” it stayed a number forever.
// Dart normally works that way too — that’s static typing (errors caught early).

// But with dynamic, Dart says:

// “Alright old man, I’ll let you do whatever you want — I’ll only check for problems when you actually run the code.”

// That’s called runtime type checking.

// -------------------------------------------------------------------------------------------------------

//constant variable and final variable : constant variable cannot change type and value but final variable can change value but not type
// Perfect — that’s the right question to ask. Let’s go slowly and make it crystal clear.

// ---

// ### 🧠 First, the two ideas you must understand:

// #### **Compile time** and **Run time**.

// ---

// ### ⚙️ 1. Compile time (before the program runs)

// Imagine you are **baking cookies**.
// Before you start baking, you **write the recipe**.
// That’s **compile time** — the computer is checking your recipe for mistakes before it starts cooking.

// ✅ Example:

// * You wrote `const pi = 3.14;`
// * The computer already knows “3.14” before running anything.
// * That means the value **never changes**, and it’s **ready before** you start running the app.

// So `const` = fixed **in the recipe** (before baking starts).

// ---

// ### 🏃‍♂️ 2. Run time (when the program is running)

// Now, you are actually **baking the cookies**.
// You can decide **some ingredients while baking**, like “add sugar based on taste.”

// That’s **runtime** — things happen **while the program is running**.

// ✅ Example:

// * `final name = DateTime.now();`
// * The computer doesn’t know the time **until the code runs**.
// * Once it knows the time, it **keeps that value**, you can’t change it later.

// So `final` = decided **while baking**, but once added, you **can’t take it out or replace it**.

// ---

// ### 🍪 Let’s put this together:

// | Type      | When decided                  | Can change value later?         | Example                         | Analogy                                                          |
// | --------- | ----------------------------- | ------------------------------- | ------------------------------- | ---------------------------------------------------------------- |
// | **const** | Before running (compile time) | ❌ No                            | `const pi = 3.14;`              | The printed recipe — fixed forever                               |
// | **final** | While running (runtime)       | ❌ No (can’t point to new thing) | `final today = DateTime.now();` | You picked an ingredient during baking — you can’t switch it now |

// ---

// ### 💡 But what if the thing *inside* changes?

// Let’s say:

// ```dart
// final list = [1, 2, 3];
// list.add(4);
// ```

// You didn’t replace the **bowl** (the variable),
// you just **put more cookies** in it (changed what’s inside).
// That’s why `final` allows this.
// But with `const`, even that is not allowed — not the bowl, not the cookies.

// ---

// ### 🧩 In one line:

// > 🟢 `final` = You can fill the bowl once, but you can stir it.
// >
// > 🔴 `const` = The bowl and what’s inside are frozen forever.

// const pi = 3.14; // constant variable
// final currenttime = DateTime(year, 6, 20, 10, 30); // final variable

void main(List<String> args) {
  print(name);
  print(city);
  print(age);
  print(year);
  // print(variable);
  // print(pi);
  // print(currenttime);

  // revice
  print(firstname);
  print(lastname);
  print(ages);
  print(birthdate);
  print(vari);
  print(currenttime);
  print(pi);
}

var firstname = 'umer';

String lastname = 'riaz';

var ages = 20;

int birthdate = 18;

dynamic vari = 'i am a just a programmer';

final currenttime = DateTime(year);

const pi = 3.90;
