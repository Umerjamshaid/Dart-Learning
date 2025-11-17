import 'dart:io';

void main() {
  stdout.write("Enter here: ");
  String? OrignalWord = stdin.readLineSync();

  if (OrignalWord == null || OrignalWord.isEmpty) {
    print("PLS Enter A Word 🥀🥀🥀🥀");
    return;
  }

  // 2. Reverse the word using a loop
  String reversedWord = reversedWithloop(OrignalWord);

  print("Enter orignal word $OrignalWord");
  print("Enter orignal word $reversedWord");
}

String reversedWithloop(String word) {
  String reversed = "";
  int length = word.length;

  for (int i = length - 1; i >= 0; i--) {
    // Add the character at the current index 'i' to the end of the new string
    reversed += word[i];
  }

  return reversed;
}
