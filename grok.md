# 🎯 DART PRACTICE MAP: THE NO-BS PATH FOR LOW-IQ BEGINNERS (2–3 HOURS)

> Listen up, rookie. If you're a beginner with an IQ around 80, that means you're starting from the bottom. No excuses about being "slow" or "not smart enough." Everyone starts dumb—winners grind until they're not. This version is tougher, with more breakdowns, repetition, and drills because you need it hammered in. More complex? Hell yes: extra layers, error traps, and logic puzzles to force your brain to level up. No hand-holding, but I'll spell it out step-by-step so even you can't mess it up without trying.
> 
> Drop the distractions. Set a timer for 3 hours max. No skipping. Type every damn line. Understand or repeat. Let's crush your noob status.

---

## 🔥 STAGE 1: INPUT & OUTPUT — LEARN TO TALK TO THE MACHINE (~30 min)

### What you *must* know (and I'll repeat it because you might forget):

* `stdin.readLineSync()`: This grabs what the user types. It's like listening.
* `stdout.write()` or `print()`: This spits out text. Use `print()` for new lines.
* Variables: Boxes for data. `String` for words, `int` for numbers. Declare like `var name = 'value';` or specify type like `String name = 'value';`.
* Null safety: Stuff can be empty (`null`). Use `?` like `String? maybeName;` to say "this might be nothing." Check with `if (maybeName != null)`.
* Parsing: Turn text into numbers with `int.parse(input)`. It crashes if wrong—handle it.

### 💪 Your tasks (do them in order, no shortcuts):

1. **Basic Greeting Drill**

   * Ask for name: Use `print('Enter your name:');` then `String? name = stdin.readLineSync();`.
   * Check if null or empty: `if (name == null || name.isEmpty) { print('You forgot to type. Do it again.'); }` — repeat this logic until you get it.
   * Print: `Hello, $name. Stop wasting time and focus.` (Use `$` to insert variables.)

2. **Age Gate with Repetition**

   * Ask for age as string.
   * Parse to int: `int age = int.tryParse(input) ?? 0;` (The `?? 0` means default to 0 if parse fails.)
   * If age < 18: `Too young. Grow up and try again.`
   * If age >= 18 and < 100: `Okay, proceed. But prove you're worth it.`
   * If invalid (like letters): `That's not a number, idiot. Enter properly.` — Make it loop until valid.
   * Extra complexity: Add a max age check (> 120? `Liar. Enter real age.`)

3. **Even/Odd Checker with Math Twist**

   * Input a number, parse it.
   * Use `% 2 == 0` for even.
   * Print: `Even: Yes/No. And it's divisible by 3? Yes/No.` (Add another check with `% 3 == 0`.)
   * Handle errors: If parse fails, print error and ask again. Loop 3 times max, then quit with `You failed basic input. Start over.`

> ⚠️ If your code crashes on bad input, you're lazy. Fix it with `try-catch` blocks: `try { int num = int.parse(input); } catch (e) { print('Bad input: $e'); }`. Repeat this stage if you screw up.

---

## 🔥 STAGE 2: LISTS & LOOPS — GROUP STUFF AND REPEAT (~45 min)

### What you *must* know (drill it in):

* Lists: Like a shopping bag. `List<String> items = ['apple', 'banana'];` Add with `items.add('new');`, remove with `items.remove('old');`.
* Loops: `for (int i = 0; i < items.length; i++) { print(items[i]); }` or simpler `for (var item in items) { print(item); }`.
* `contains()`: Checks if something's in the list: `if (items.contains('apple')) { ... }`.
* Indexing: Lists start at 0. `items[0]` is first item.

### 💪 Your tasks (build on each other—don't start fresh every time):

1. **Inventory System (Build and Print)**

   * Create `List<String> inventory = ['sword', 'shield', 'potion', 'map', 'key'];`.
   * Print all with numbered loop: `for (int i = 0; i < inventory.length; i++) { print('${i+1}: ${inventory[i]}'); }` (Makes it 1-based for humans.)
   * Extra: Sort the list alphabetically with `inventory.sort();` and print again. Understand why it changes order.

2. **Availability Checker with Add/Remove**

   * Ask: "What do you want?"
   * If in list: `Available. Want to take it? (y/n)`
     * If y: Remove it, print updated list.
   * If not: `Not here. Add it? (y/n)`
     * If y: Add it, print updated list.
   * Loop this 5 times to practice repetition. Track changes.

3. **Movie Collector with Validation**

   * Empty list: `List<String> movies = [];`.
   * Loop 3 times: Ask for movie, check if not empty, add if unique (use `!movies.contains(input)`).
   * If duplicate: `Already have that. Pick another.`
   * Final print: `Your movies: ${movies.join(', ')}` (Joins with commas.)
   * Complexity boost: After collecting, ask to remove one by name. Handle if not found.

> ⚠️ No validation? You're building junk code. Always check lengths, empties, and duplicates. If your loop runs forever, debug with `print('Loop count: $i');`. Repeat tasks if lists confuse you.

---

## 🔥 STAGE 3: FUNCTIONS — MODULARIZE OR DIE (~45 min)

### What you *must* know (repeat after me):

* Functions: Reusable code blocks. `String greet(String name) { return 'Hello, $name'; }` — Call with `print(greet('Bob'));`.
* Parameters: Inputs to functions.
* Returns: Outputs. Void if none: `void printStuff() { ... }`.
* Scope: Variables inside functions stay inside unless returned.

### 💪 Your tasks (each in its own function—stop cramming into main()):

1. **Floor Selector Function**

   * Function: `String? selectFloor(int choice) { List<String> floors = ['1st', '2nd', '3rd']; if (choice > 0 && choice <= floors.length) { return floors[choice-1]; } return null; }`
   * In main: Print options, get input, call function, print result or `Invalid choice. Try again.`
   * Extra: Make function handle invalid with loop inside it.

2. **Menu System Function**

   * Function: `void showMenu(List<String> inventory) { ... }` — Pass the list from Stage 2.
   * Inside: Print menu:
     ```
     1. Add item
     2. Remove item
     3. View list
     4. Sort list
     5. Exit
     ```
   * Use `switch (choice) { case '1': ... }` to handle.
   * Call from main in a loop until exit.
   * Complexity: Add '4. Sort' using `inventory.sort();`. Return updated inventory if needed.

3. **Calculator Helper Function**

   * New function: `int calculate(int a, int b, String op) { if (op == '+') return a + b; ... }` (Handle +, -, *, / with checks for divide by zero.)
   * In main: Ask for two numbers and op, call function, print result. Loop for 3 calculations.

> ⚠️ Everything in main? You're a mess. Functions make code readable. Test each function alone with prints. If params confuse you, write 2-3 test calls.

---

## 🧠 STAGE 4: BONUS CHALLENGE — INTEGRATE AND TEST (~30–45 min)

### 💪 Task: **Mini Quiz App with Inventory Twist**

* Use functions from before.
* Create quiz: 3 questions, e.g.:
  1. What's 2+2? A:3 B:4 C:5
  2. Capital of France? A:Paris B:London C:Berlin
  3. Even number? A:1 B:2 C:3
* Store answers in list: `List<String> correct = ['B', 'A', 'B'];`
* Loop: Ask question, get input (A/B/C), check with `if (input.toUpperCase() == correct[i]) score++;`
* Final: `Score: $score/3. Reward: Add $score items to inventory.` — Integrate Stage 2 list, add dummy items based on score.
* Extra complexity: If score < 2, force retry of one question.

> ⚠️ Tie it all together. If it breaks, trace back to which stage failed.

---

# 🧱 CORE PRINCIPLES TO FOLLOW (MEMORIZE THESE):

| Rule                           | What It Means (For Your Low-IQ Brain)                       |
| ------------------------------ | ----------------------------------------------------------- |
| **No blind copying**           | Type it. Read it. Change one thing and see what breaks.     |
| **Break errors, fix them 3x**  | Run code with bad input on purpose. Fix. Repeat twice more. |
| **Validate everything**        | Check null, empty, wrong types. Or your app is trash.       |
| **Functions everywhere**       | Big code? Split into functions. Call them like tools.       |
| **Repeat drills daily**        | Do this map 3 days straight. Add one new twist each time.   |

---

## ❗ If you finish early (unlikely for beginners):

* Add file I/O: Save inventory to a text file with `File('inventory.txt').writeAsString(inventory.join('\n'));` (Import `dart:io;`).
* Handle more errors: Use enums for menu choices.
* Build a simple class: `class Item { String name; int qty; }` and use in lists.

---

## ✅ After 3 Hours, You Should Be Able To:

* Handle input/output with full error checking.
* Manipulate lists like a pro (add/remove/sort/check).
* Write and call functions with params/returns.
* Build interactive apps that don't crash on stupid inputs.
* Debug your own messes.

If not? You're not trying hard enough. Repeat **twice a day** for a week. Build muscle memory.

---
asdasdasdasd
asdasdasdasdas
asdasdadsasda
asda
-- ------------------a---------------------------------------------------------------------------------------------------------------- --
---asdasdasdasd
asdasdasdasdas
asdasdadsasda
asda
asdasdasdasdasdasdasdasd
asdasdasdasdas
asdasdadsasda
asdaasdasdasdasd
asdasdasdasdas
asdasdadsasda
asdaasdasdasdasd
asdasdasdasdas
asdasdadsasda
asdaasdasdasdasd
asdasdasdasdas
asdasdadsasda
asdaasdasdasdasd
asdasdasdasdas
asdasdadsasda
asdaasdasdasdasd
asdasdasdasdas
asdasdadsasda
asdaasdasdasdasd
asdasdasdasdas
asdasdadsasda
asdaasdasdasdasd
asdasdasdasdas
asdasdadsasda
asdaasdasdasdasd
asdasdasdasdas
asdasdadsasda
asdaasdasdasdasd
asdasdasdasdas
asdasdadsasda
asdaasdasdasdasd
asdasdasdasdas
asdasdadsasda
asdaasdasdasdasdasdasdasdasd
asdasdasdasdas
asdasdadsasda
asdaasdasdasdasd
asdasdasdasdas
asdasdadsasda
asdaasdasdasdasd
asdasdasdasdas
asdasdadsasda
asdaasdasdasdasd
asdasdasdasdas
asdasdadsasda
asdaasdasdasdasd
asdasdasdasdas
asdasdadsasda
asdaasdasdasdasd
asdasdasdasdas
asdasdadsasda
asdaasdasdasdasd
asdasdasdasdas
asdasdadsasda
asdaasdasdasdasd
asdasdasdasdas
asdasdadsasda
asdaasdasdasdasd
asdasdasdasdas
asdasdadsasda
asdaasdasdasdasd
asdasdasdasdas
asdasdadsasda
asdaasdasdasdasd
asdasdasdasdas
asdasdadsasda
asdaasdasdasdasd
asdasdasdasdas
asdasdadsasda
asdaasdasdasdasd
asdasdasdasdas
asdasdadsasda
asdaasdasdasdasd
asdasdasdasdas
asdasdadsasda
asdaasdasdasdasd
asdasdasdasdas
asdasdadsasda
asdaasdasdasdasd
asdasdasdasdas
asdasdadsasda
asdaasdasdasdasd
asdasdasdasdas
asdasdadsasda
asdaasdasdasdasd
asdasdasdasdas
asdasdadsasda
asdaasdasdasdasd
asdasdasdasdas
asdasdadsasda
asdaasdasdasdasd
asdasdasdasdas
asdasdadsasda
asdaasdasdasdasd
asdasdasdasdas
asdasdadsasda
asdaasdasdasdasd
asdasdasdasdas
asdasdadsasda
asdaasdasdasdasd
asdasdasdasdas
asdasdadsasda
asdaasdasdasdasd
asdasdasdasdas
asdasdadsasda
asdaasdasdasdasd
asdasdasdasdas
asdasdadsasda
asdaasdasdasdasd
asdasdasdasdas
asdasdadsasda
asdaasdasdasdasd
asdasdasdasdas
asdasdadsasda
asdaasdasdasdasd
asdasdasdasdas
asdasdadsasda
asdaasdasdasdasd
asdasdasdasdas
asdasdadsasda
asdaasdasdasdasd
asdasdasdasdas
asdasdadsasda
asdaasdasdasdasd
asdasdasdasdas
asdasdadsasda
asdaasdasdasdasd
asdasdasdasdas
asdasdadsasda
asdaasdasdasdasd
asdasdasdasdas
asdasdadsasda
asdaasdasdasdasd
asdasdasdasdas
asdasdadsasda
asdaasdasdasdasd
asdasdasdasdas
asdasdadsasda
asdaasdasdasdasd
asdasdasdasdas
asdasdadsasda
asdaasdasdasdasd
asdasdasdasdas
asdasdadsasda
asdaasdasdasdasd
asdasdasdasdas
asdasdadsasda
asdaasdasdasdasd
asdasdasdasdas
asdasdadsasda
asdaasdasdasdasd
asdasdasdasdas
asdasdadsasda
asdaasdasdasdasd
asdasdasdasdas
asdasdadsasda
asdaasdasdasdasd
asdasdasdasdas
asdasdadsasda
asdaasdasdasdasd
asdasdasdasdas
asdasdadsasda
asdaasdasdasdasd
asdasdasdasdas
asdasdadsasda
asdaasdasdasdasd
asdasdasdasdas
asdasdadsasda
asda
asdasdasdasdas
asdasdadsasda
asdaasdasdasdasd
asdasdasdasdas
asdasdadsasda
asdaasdasdasdasd
asdasdasdasdas
asdasdadsasda
asdaasdasdasdasd
asdasdasdasdas
asdasdadsasda
asdaasdasdasdasd
asdasdasdasdas
asdasdadsasda
asdaasdasdasdasd
asdasdasdasdas
asdasdadsasda
asda
asdasdasdasdas
asdasdadsasda
asda
asdasdasdasd
asdasdasdasdas
asdasdadsasda
asdaasdasdasdasd
asdasdasdasdas
asdasdadsasda
asda



----


# 🎯 DART PRACTICE MAP: THE NO-BS PATH (2–3 HOURS NOW – WE'RE STEPPING IT UP)
> Listen up. You said you want more complexity? Fine. But if you're a true beginner – yeah, even if your brain feels slow or foggy (IQ 80? Whatever, labels don't matter) – this ain't about speed. It's about **grinding slow and smart**. We're adding layers: more steps, why-it-works breakdowns, and **fill-in-the-blank code templates** so you don't stare at a blank screen like a deer in headlights. No magic – just bite-sized chunks you **must** chew and swallow.
> 
> Rules stay the same:  No excuses. No skipping. Type every line yourself (templates help, but fill 'em). Errors? Hug 'em like a bad habit – debug 'til it works. You've got 3 hours now (we stretched it 'cause complexity = time). Waste it? You're wasting yourself.
> 
> **Pro Tip for Slow Brains:** Read each "Why?" out loud. Pause after every task. Run your code. If it breaks, read the error **twice**. Then fix. Repeat daily if needed. You're building muscle memory, not cramming facts.

---

## 🔥 STAGE 1: INPUT & OUTPUT — LEARN TO COMMUNICATE (BETTER & SLOWER, ~30 min)
### What you *must* know (Broken Down Simple):
* `stdin.readLineSync()`: Grabs what the user types. It's like waiting for a friend to text back – but in code.
* `stdout.write()`: Spits out text to the screen. No fancy prints yet; keep it raw.
* Variables: Boxes for stuff. `String` for words (like "hello"). `int` for numbers (like 42). Declare 'em with `var` or straight-up type.
* Null safety: Dart hates surprises. `String?` means "might be empty/nothing." Always check: `if (name != null) { ... }` or use `!` carefully (but don't abuse it yet).

**Why?** Programs talk to people. If you can't ask/show basics without crashing, you're dead in the water. Start here or stay a noob.

### 💪 Your Tasks (With Templates – Fill the Blanks):
1. **Greet the User** (Easier Start, But Add a Twist: Handle Empty Names)
   * Ask for name. If blank? Yell at 'em to try again.
   * Print: `Hello, <name>. Now get to work.`
   
   **Code Template (Fill Blanks):**
   ```dart
   import 'dart:io';  // This lets you use stdin/stdout. Don't forget!

   void main() {
     print('What\'s your name? ');  // Prompt the user.
     String? name = stdin.readLineSync();  // Grab input. Might be null.

     // BLANK 1: Check if name is null or empty. If so, print "Name can't be blank, idiot. Try again." and... (hint: use a loop or just re-ask once).
     // Example: while (name == null || name.isEmpty) { ... }

     // BLANK 2: Now greet properly.
     stdout.write('Hello, $ _____ . Now get to work.');  // Use string interpolation here.
   }
   ```

2. **Age Gate** (Complexity Bump: Handle Non-Number Input)
   * Ask for age. If not a number? Say "That's not a number. Use digits only." and re-ask.
   * If age < 18 → `You’re not ready. Come back stronger.`
   * Else → `Good. Let’s continue. Proceed to math.`

   **Code Template (Fill Blanks):**
   ```dart
   import 'dart:io';

   void main() {
     bool validAge = false;  // Flag to track if input is good.
     int? age;

     while (!validAge) {  // Loop until we get a real number.
       print('How old are you? ');
       String? input = stdin.readLineSync();

       // BLANK 1: Try to parse. Use try { age = int.parse(input!); } catch (e) { print("Not a number!"); }
       // If parse works, set validAge = true;

       // BLANK 2: After loop, check age.
       if (age! _____ 18) {  // Fill operator.
         print('You’re not ready. Come back stronger.');
       } else {
         print('Good. Let’s continue.');
       }
     }
   }
   ```

3. **Even or Odd** (Add: Multiple Numbers? Average 'Em)
   * Input 2 numbers (one by one).
   * Check each with `%` (modulo: number % 2 == 0? Even!).
   * Bonus: Print average. (Why? Forces math basics.)

   **Why %?** It's like checking leftovers after dividing by 2. 4 % 2 = 0 (even, no leftover). 5 % 2 = 1 (odd).

   **Code Template (Fill Blanks):**
   ```dart
   import 'dart:io';

   void main() {
     // BLANK 1: Get first number (use int.parse like above, handle errors).

     int num1 = /* your parsed input */;
     // BLANK 2: Get second number.
     int num2 = /* same */;

     // BLANK 3: Check even/odd for both.
     String result1 = (num1 % 2 == 0) ? 'even' : 'odd';  // Ternary operator – if true, even.
     // Do same for num2.

     print('$num1 is $result1, $num2 is $ _____ .');  // Fill.

     // BLANK 4: Average = (num1 + num2) / 2. But use toDouble() for decimal. Print it.
   }
   ```

> ⚠️ Parsing fails? Google "Dart int.parse exception" in your head (or actually, later). No quitting. Test with bad inputs like "abc".

---

## 🔥 STAGE 2: LISTS & LOOPS — THINK IN GROUPS (DEEPER, ~45 min)
### What you *must* know (Extra Simple Why):
* `List<String>`: A shopping bag for words. `List<int>` for numbers. Create: `List<String> items = [];` or `['apple', 'banana'];`.
* `for` loop: `for (int i = 0; i < list.length; i++) { print(list[i]); }` – counts steps.
* `for-in` loop: `for (String item in items) { print(item); }` – easier, like "for each thing in bag".
* `contains()`: `if (items.contains('apple')) { ... }` – checks if inside.

**Why Groups?** Real life ain't one thing. Lists let you handle many. Loops = automation. No lists? You're handwriting a novel by copying each word.

### 💪 Your Tasks (Templates + Validation Twist):
1. **Inventory System (Manual + Sort It)**
   * List of 5 items.
   * Print with loop. Then sort alphabetically (use `sort()`). Re-print.

   **Code Template:**
   ```dart
   void main() {
     List<String> inventory = [ /* BLANK 1: Fill 5 items, like 'sword', 'potion' */ ];

     // BLANK 2: Print with for-in loop.
     for (String item in inventory) {
       print('Item: $item');
     }

     // BLANK 3: Sort and re-print.
     inventory. _____ ();  // sort
     print('Sorted:');
     for ( /* BLANK 4: Reuse loop */ ) {
       // print
     }
   }
   ```

2. **Check Availability (Case-Insensitive)**
   * User wants item. Check ignoring caps (use `toLowerCase()`).
   * In list? `Here you go.` Else `Out of stock. Suggestion: Try 'apple' instead.` (Hardcode one close match).

   **Why Case?** Users are sloppy. Code must be smart.

3. **Movie Collector (Dynamic Size + Duplicate Check)**
   * Ask for movies until user says "done".
   * Store in list. Check/add only if not duplicate (use `!contains`).
   * Print final list.

   **Code Template:**
   ```dart
   import 'dart:io';

   void main() {
     List<String> movies = [];  // Empty start.
     String? input;

     while (true) {  // Infinite loop – break when done.
       print('Enter a movie (or "done"): ');
       input = stdin.readLineSync();

       // BLANK 1: If input == 'done' (trim whitespace: input?.trim()), break;
       // Else, check if !movies.contains(input!.toLowerCase()), then add.

       if ( /* condition */ ) {
         movies.add(input!);
         print('Added: $input');
       } else if (input!.trim() != 'done') {
         print('Duplicate! Skipping.');
       }
     }

     // BLANK 2: Print list.
     print('Your list: $movies');  // Or loop if you want fancy.
   }
   ```

> ⚠️ Lists empty? Loops infinite? That's on you. Debug: Add `print('Debug: list length ${movies.length}');` everywhere.

---

## 🔥 STAGE 3: FUNCTIONS — BREAK IT DOWN (REUSABLE & TESTABLE, ~45 min)
### What you *must* know (Why Breakdown?):
* Syntax: `String greet(String name) { return 'Hi $name'; }` – Name it, params in (), body in {}, return what it gives back.
* Params: Inputs. Like recipe ingredients.
* Return: Output. No return? Use `void` (nothing back).

**Why Functions?** main() is your house. Functions are rooms. Clutter in one place = mess. Break it = clean brain.

### 💪 Your Tasks (Templates with Calls):
1. **Option Selector (With Error Handling)**
   * Function takes list of options, user picks 1-3.
   * Return selected or "Invalid choice, dummy."

   **Code Template:**
   ```dart
   import 'dart:io';

   String? selectOption(List<String> options) {  // Returns String? (nullable).
     for (int i = 0; i < options.length; i++) {
       print('${i+1}. ${options[i]}');  // Number 'em.
     }

     String? choice = stdin.readLineSync();
     int? num = int.tryParse(choice ?? '');  // Safe parse.

     // BLANK 1: If num >=1 && num <= options.length, return options[num-1];
     // Else return null;

     return /* your logic */;
   }

   void main() {
     List<String> floors = ['1st-floor', '2nd-floor', '3rd-floor'];
     String? selected = selectOption(floors);
     if (selected != null) {
       print('You picked: $selected');
     } else {
       print('Invalid!');
     }
   }
   ```

2. **Create a Menu Function (Full Interactive)**
   * Function `showMenu()`: Prints menu, gets choice, calls sub-functions (like addItem()).
   * Loop until "4. Exit".
   * Sub-task: Write `void addItem(List<String> list)` that asks and adds.

   **Complexity: Nested Functions.** Call from main.

   **Code Template:**
   ```dart
   import 'dart:io';

   void addItem(List<String> list) {  // BLANK: Ask input, add to list.
     // ...
   }

   void showMenu() {
     List<String> items = [];  // Global-ish for menu.

     while (true) {
       print('1. Add item\n2. Remove item\n3. View list\n4. Exit');

       String? choice = stdin.readLineSync();

       // BLANK 1: Use switch or if/else.
       switch (choice) {
         case '1':
           addItem(items);
           break;
         // BLANK 2: Case 2: Ask for item to remove, use removeWhere or index.
         // Case 3: Loop print list.
         // Case 4: return; (exits loop)
         default:
           print('Bad choice.');
       }
     }
   }

   void main() {
     showMenu();  // Call it.
   }
   ```

> ⚠️ Functions not called? Code scattered? Refactor now. Test each function alone.

---

## 🧠 STAGE 4: BONUS CHALLENGE — TEST YOURSELF (HARDER QUIZ, ~30–45 min)
### 💪 Task: **Mini Quiz App** (With Functions & Lists)
* Use a `List<Map<String, dynamic>>` for questions: Each map has 'question', 'options' (list), 'answer'.
* 4 questions now (add one math).
* Function to ask one question, check answer.
* Track score in main.
* End: `You got X/4. Grade: A if 4, B if 3, etc.` + Replay option.

**Why Maps?** Next level lists – key-value like a dictionary.

**Code Template (Big One – Fill Step-by-Step):**
```dart
import 'dart:io';

Map<String, dynamic> askQuestion(Map<String, dynamic> q) {
  print(q['question']);
  List<String> opts = q['options'];
  for (int i = 0; i < opts.length; i++) {
    print('${String.fromCharCode(65 + i)}. ${opts[i]}');  // A, B, C.
  }

  String? ans = stdin.readLineSync()?.toUpperCase();
  // BLANK 1: Return 1 if ans == q['answer'], else 0. (Use int.)

  return {'correct': /* logic */};
}

void main() {
  List<Map<String, dynamic>> quiz = [
    {
      'question': 'What is 2+2?',
      'options': ['A. 3', 'B. 4', 'C. 5'],
      'answer': 'B'
    },
    // BLANK 2: Add 3 more. One on Dart: "What does % do? A. Add B. Modulo C. Subtract"
  ];

  int score = 0;
  for (var question in quiz) {
    var result = askQuestion(question);
    score += result['correct'];  // BLANK 3: Add if 1.
  }

  // BLANK 4: Print score. If score == 4, 'A!', etc. Ask "Replay? y/n"
  print('You got $score/${quiz.length} correct.');
}
```

---

# 🧱 CORE PRINCIPLES TO FOLLOW (Updated for You):
| Rule | What It Means | Beginner Hack |
| ------------------------------ | ---------------------------------------------------- | --------------------- |
| **No blind copying** | Type every line. Templates are crutches – kick 'em away soon. | Whisper code aloud while typing. |
| **Break errors, fix them** | Errors teach. Read line-by-line. | Copy error to notepad. Guess fix, test. |
| **Don't skip validation** | Bad input = crashes. Always try-catch or check null. | Test with junk: "", "abc", negatives. |
| **No function = no structure** | Modular = fixable. Call functions like tools. | Name functions what they do: `greetUser()`, not `func1()`. |
| **New: Slow Wins** | If IQ feels low, do one task. 3x. Tomorrow, add one. | Timer: 10 min per blank. Stuck? Walk, come back. |

---

## ❗ If you finish early (Or Stuck – Do This Instead):
* **Expand Quiz:** Add timers? (Use `sleep(Duration(seconds: 1));` – import 'dart:async').
* **Better Errors:** Custom messages per fail.
* **Refactor Everything:** One file? Split to multiple (import 'other.dart').

---

## ✅ After 3 Hours, You Should Be Able To:
* Handle messy input like a pro (parsing, nulls, loops).
* Loop lists dynamically, sort/check 'em.
* Build reusable functions that call each other.
* Make data-driven apps (maps, scores).
* Debug without crying.

If not? **Repeat Stage 1 tomorrow. Then 2. Build up.** No mercy, but no rush. You're forging steel here – slow fire burns hottest. Get after it.