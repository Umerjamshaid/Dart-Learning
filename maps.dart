// void main() {
//   // todo: Maps! Key/Value pairs
//   var toppings = {
//     "John": "Chikken tikka",
//     "umer": "Cheese",
//     "usman": "Pepporni",
//   };
//   print(toppings);
//   print(toppings["John"]);

//   // Show Value
//   print(toppings.values);
//   //Show Keys
//   print(toppings.keys);
//   //Shows length
//   print(toppings.length);

//   //Add Somthings
//   toppings["tim"] = "Tikka";
//   print(toppings);

//   // Add many things
//   toppings.addAll({"Tina": "Susage", "Ali": "Cheezy", "hamdan": "Chocolate"});
//   print(toppings);

//   // Remove things
//   toppings.remove("umer");
//   print(toppings);

//   //  Clear everything
//   toppings.clear();
//   print(toppings);
// }

import 'dart:io';

// ============================================================================
// VERSION 1: BASIC REFINEMENTS
// ============================================================================
void basicVersion() {
  final students = <String, int>{};
  const studentCount = 3;
  const passingMarks = 40;

  // Input validation loop
  for (int i = 1; i <= studentCount; i++) {
    String name;
    int marks;

    // Get valid name
    do {
      stdout.write('Enter name of student $i: ');
      name = stdin.readLineSync()?.trim() ?? '';
      if (name.isEmpty) print('❌ Name cannot be empty!');
    } while (name.isEmpty);

    // Get valid marks
    do {
      stdout.write('Enter marks for $name (0-100): ');
      try {
        marks = int.parse(stdin.readLineSync() ?? '');
        if (marks < 0 || marks > 100) {
          print('❌ Marks must be between 0 and 100!');
          marks = -1; // Invalid flag
        }
      } catch (e) {
        print('❌ Please enter a valid number!');
        marks = -1;
      }
    } while (marks < 0);

    students[name] = marks;
  }

  // Calculate and display
  print('\n${'=' * 40}');
  print('STUDENT MARKS REPORT'.padLeft(25));
  print('=' * 40);

  int total = 0;
  students.forEach((name, marks) {
    print('${name.padRight(20)} : ${marks.toString().padLeft(3)}');
    total += marks;
  });

  final average = total / students.length;
  print('${'=' * 40}');
  print('Average Marks: ${average.toStringAsFixed(2)}');

  print('\n${'=' * 40}');
  print('RESULTS'.padLeft(22));
  print('=' * 40);
  students.forEach((name, marks) {
    final status = marks >= passingMarks ? '✅ PASSED' : '❌ FAILED';
    print('${name.padRight(20)} → $status');
  });
  print('=' * 40);
}

// ============================================================================
// VERSION 2: OBJECT-ORIENTED APPROACH (RECOMMENDED)
// ============================================================================

class Student {
  final String name;
  final int marks;

  Student(this.name, this.marks);

  bool get isPassed => marks >= 40;
  String get grade {
    if (marks >= 90) return 'A+';
    if (marks >= 80) return 'A';
    if (marks >= 70) return 'B';
    if (marks >= 60) return 'C';
    if (marks >= 50) return 'D';
    if (marks >= 40) return 'E';
    return 'F';
  }

  @override
  String toString() => '$name: $marks (Grade: $grade)';
}

class StudentManager {
  final List<Student> _students = [];
  static const _passingMarks = 40;
  static const _maxMarks = 100;

  // Add student with validation
  bool addStudent(String name, int marks) {
    if (name.trim().isEmpty) {
      print('❌ Invalid name!');
      return false;
    }
    if (marks < 0 || marks > _maxMarks) {
      print('❌ Marks must be between 0 and $_maxMarks!');
      return false;
    }
    _students.add(Student(name.trim(), marks));
    return true;
  }

  // Calculate average
  double get average => _students.isEmpty
      ? 0
      : _students.fold(0, (sum, s) => sum + s.marks) / _students.length;

  // Get pass/fail statistics
  Map<String, int> get statistics => {
    'total': _students.length,
    'passed': _students.where((s) => s.isPassed).length,
    'failed': _students.where((s) => !s.isPassed).length,
  };

  // Display report
  void displayReport() {
    if (_students.isEmpty) {
      print('No students to display!');
      return;
    }

    print('\n${'=' * 50}');
    print('STUDENT MARKS REPORT'.padLeft(30));
    print('=' * 50);
    print('${'Name'.padRight(20)} Marks  Grade  Status');
    print('-' * 50);

    for (var student in _students) {
      final status = student.isPassed ? '✅ PASSED' : '❌ FAILED';
      print(
        '${student.name.padRight(20)} ${student.marks.toString().padLeft(3)}    ${student.grade.padRight(3)}   $status',
      );
    }

    print('=' * 50);
    print('Average Marks: ${average.toStringAsFixed(2)}');

    final stats = statistics;
    print(
      'Total: ${stats['total']} | Passed: ${stats['passed']} | Failed: ${stats['failed']}',
    );
    print(
      'Pass Rate: ${((stats['passed']! / stats['total']!) * 100).toStringAsFixed(1)}%',
    );
    print('=' * 50);
  }

  // Get top performers
  List<Student> getTopPerformers(int count) {
    final sorted = List<Student>.from(_students)
      ..sort((a, b) => b.marks.compareTo(a.marks));
    return sorted.take(count).toList();
  }
}

void objectOrientedVersion() {
  final manager = StudentManager();
  const studentCount = 3;

  print('📚 STUDENT MARKS MANAGEMENT SYSTEM\n');

  for (int i = 1; i <= studentCount; i++) {
    print('--- Student $i ---');

    // Get name
    String? name;
    do {
      stdout.write('Enter name: ');
      name = stdin.readLineSync()?.trim();
      if (name == null || name.isEmpty) {
        print('❌ Name cannot be empty!');
      }
    } while (name == null || name.isEmpty);

    // Get marks
    int? marks;
    do {
      stdout.write('Enter marks (0-100): ');
      try {
        marks = int.parse(stdin.readLineSync() ?? '');
        if (marks < 0 || marks > 100) {
          print('❌ Marks must be between 0 and 100!');
          marks = null;
        }
      } catch (e) {
        print('❌ Invalid input! Please enter a number.');
        marks = null;
      }
    } while (marks == null);

    manager.addStudent(name, marks);
    print('✅ Student added successfully!\n');
  }

  // Display report
  manager.displayReport();

  // Show top performer
  final topStudents = manager.getTopPerformers(1);
  if (topStudents.isNotEmpty) {
    print('\n🏆 Top Performer: ${topStudents.first}');
  }
}

// ============================================================================
// VERSION 3: ADVANCED WITH EXTENSIONS & HELPER METHODS
// ============================================================================

extension StringValidation on String {
  bool get isValidName => trim().isNotEmpty && length >= 2;
}

extension IntValidation on int {
  bool isValidMarks({int min = 0, int max = 100}) => this >= min && this <= max;
}

class InputHelper {
  // Generic input reader with validation
  static T? readInput<T>({
    required String prompt,
    required T? Function(String) parser,
    required bool Function(T) validator,
    String? errorMessage,
  }) {
    while (true) {
      stdout.write(prompt);
      final input = stdin.readLineSync();
      if (input == null || input.trim().isEmpty) {
        print(errorMessage ?? '❌ Invalid input!');
        continue;
      }

      try {
        final parsed = parser(input.trim());
        if (parsed != null && validator(parsed)) {
          return parsed;
        }
        print(errorMessage ?? '❌ Invalid input!');
      } catch (e) {
        print(errorMessage ?? '❌ Invalid input!');
      }
    }
  }

  static String readName() => readInput<String>(
    prompt: 'Enter name: ',
    parser: (s) => s,
    validator: (s) => s.isValidName,
    errorMessage: '❌ Name must be at least 2 characters!',
  )!;

  static int readMarks() => readInput<int>(
    prompt: 'Enter marks (0-100): ',
    parser: (s) => int.parse(s),
    validator: (m) => m.isValidMarks(),
    errorMessage: '❌ Marks must be between 0 and 100!',
  )!;
}

void advancedVersion() {
  final manager = StudentManager();
  const studentCount = 3;

  print('📚 ADVANCED STUDENT MARKS SYSTEM\n');

  for (int i = 1; i <= studentCount; i++) {
    print('--- Student $i ---');
    final name = InputHelper.readName();
    final marks = InputHelper.readMarks();
    manager.addStudent(name, marks);
    print('✅ Added successfully!\n');
  }

  manager.displayReport();

  // Additional analytics
  print('\n📊 ANALYTICS');
  print('=' * 50);
  final topStudents = manager.getTopPerformers(3);
  print('\n🏆 Top Performers:');
  for (var i = 0; i < topStudents.length; i++) {
    print('  ${i + 1}. ${topStudents[i]}');
  }
}

// ============================================================================
// VERSION 4: PRODUCTION-READY WITH ERROR HANDLING & LOGGING
// ============================================================================

enum LogLevel { info, success, warning, error }

class Logger {
  static void log(String message, [LogLevel level = LogLevel.info]) {
    final prefix = switch (level) {
      LogLevel.info => 'ℹ️ ',
      LogLevel.success => '✅',
      LogLevel.warning => '⚠️ ',
      LogLevel.error => '❌',
    };
    print('$prefix $message');
  }
}

class ValidationException implements Exception {
  final String message;
  ValidationException(this.message);

  @override
  String toString() => message;
}

class StudentInput {
  final String name;
  final int marks;

  StudentInput._(this.name, this.marks);

  factory StudentInput.create(String name, int marks) {
    // Validate name
    final trimmedName = name.trim();
    if (trimmedName.isEmpty) {
      throw ValidationException('Name cannot be empty');
    }
    if (trimmedName.length < 2) {
      throw ValidationException('Name must be at least 2 characters');
    }
    if (!RegExp(r'^[a-zA-Z\s]+$').hasMatch(trimmedName)) {
      throw ValidationException('Name can only contain letters and spaces');
    }

    // Validate marks
    if (marks < 0 || marks > 100) {
      throw ValidationException('Marks must be between 0 and 100');
    }

    return StudentInput._(trimmedName, marks);
  }
}

class ProductionStudentSystem {
  final StudentManager _manager = StudentManager();

  void run({int studentCount = 3}) {
    Logger.log('Student Marks Management System', LogLevel.info);
    print('${'=' * 50}\n');

    for (int i = 1; i <= studentCount; i++) {
      if (!_addStudent(i)) {
        Logger.log('Failed to add student $i', LogLevel.error);
        i--; // Retry
      }
    }

    _displayResults();
  }

  bool _addStudent(int index) {
    try {
      print('--- Student $index ---');

      // Get and validate name
      stdout.write('Enter name: ');
      final name = stdin.readLineSync()?.trim() ?? '';

      // Get and validate marks
      stdout.write('Enter marks (0-100): ');
      final marksStr = stdin.readLineSync()?.trim() ?? '';
      final marks = int.tryParse(marksStr);

      if (marks == null) {
        throw ValidationException('Invalid marks format');
      }

      // Create validated input
      final input = StudentInput.create(name, marks);

      // Add to manager
      if (_manager.addStudent(input.name, input.marks)) {
        Logger.log('Student added successfully!', LogLevel.success);
        print('');
        return true;
      }

      return false;
    } on ValidationException catch (e) {
      Logger.log(e.toString(), LogLevel.error);
      return false;
    } catch (e) {
      Logger.log('Unexpected error: $e', LogLevel.error);
      return false;
    }
  }

  void _displayResults() {
    _manager.displayReport();

    // Additional insights
    print('\n📊 DETAILED ANALYTICS');
    print('=' * 50);

    final top3 = _manager.getTopPerformers(3);
    print('\n🏆 Top 3 Performers:');
    for (var i = 0; i < top3.length; i++) {
      print('  ${i + 1}. ${top3[i]}');
    }

    final stats = _manager.statistics;
    final passRate = (stats['passed']! / stats['total']!) * 100;

    if (passRate >= 80) {
      Logger.log(
        'Excellent class performance! ($passRate% pass rate)',
        LogLevel.success,
      );
    } else if (passRate >= 60) {
      Logger.log(
        'Good class performance. ($passRate% pass rate)',
        LogLevel.info,
      );
    } else {
      Logger.log(
        'Class needs improvement. ($passRate% pass rate)',
        LogLevel.warning,
      );
    }
  }
}

// ============================================================================
// MAIN FUNCTION - SELECT VERSION TO RUN
// ============================================================================

void main() {
  print('Select version to run:');
  print('1. Basic Refined Version');
  print('2. Object-Oriented Version (Recommended)');
  print('3. Advanced Version with Extensions');
  print('4. Production-Ready Version');
  stdout.write('\nEnter choice (1-4): ');

  final choice = stdin.readLineSync();

  print('\n');

  switch (choice) {
    case '1':
      basicVersion();
      break;
    case '2':
      objectOrientedVersion();
      break;
    case '3':
      advancedVersion();
      break;
    case '4':
      ProductionStudentSystem().run();
      break;
    default:
      print('Invalid choice! Running recommended version...\n');
      objectOrientedVersion();
  }
}
