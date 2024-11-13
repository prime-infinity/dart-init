import 'dart:math';

void main() {
  final question = generateRandomQuestion(1);
  // Print the question text
  print("Question ${question.questionNumber}: ${question.questionText}");

  // Print the answer options
  print("Options:");
  for (var option in question.options) {
    option.forEach((key, value) {
      print("$key: $value");
    });
  }
}

Question generateRandomQuestion(int questionNumber) {
  final random = Random();
  final operation = Operation.values[random.nextInt(Operation.values.length)];

  // Adjust ranges based on difficulty
  final operand1 = random.nextInt(200) + 1;
  final operand2 = random.nextInt(200) + 1;

  final correctAnswer = operation.calculate(operand1, operand2);

  // Generate wrong options within a reasonable range
  final wrongOptions = List.generate(3, (_) {
    int wrong;
    do {
      wrong =
          (correctAnswer + random.nextInt(5) * (random.nextBool() ? 1 : -1));
    } while (wrong == correctAnswer);
    return wrong;
  });

  final allOptions = [...wrongOptions, correctAnswer];
  allOptions.shuffle();

  return Question(
    operand1: operand1,
    operand2: operand2,
    operation: operation,
    questionNumber: questionNumber,
    options: List.generate(
      4,
      (i) => {String.fromCharCode(97 + i): allOptions[i]},
    ),
  );
}

class Question {
  Question({
    required this.operand1,
    required this.operand2,
    required this.operation,
    required this.questionNumber,
    required List<Map<String, int>> options,
  })  : _options = options,
        _result = operation.calculate(operand1, operand2) {
    // Validate that one option matches the result
    if (!options.any((option) => option.values.first == _result)) {
      throw ArgumentError('One option must match the correct result: $_result');
    }
  }

  final int operand1;
  final int operand2;
  final Operation operation;
  final int questionNumber;
  final List<Map<String, int>> _options;
  final int _result;

  //getters
  List<Map<String, int>> get options => List.unmodifiable(_options);

  // Get question as string for display
  String get questionText => '$operand1 ${operation.symbol} $operand2';

  // Check answer directly
  bool isCorrect(int answer) => answer == _result;
}

enum Operation {
  addition,
  subtraction,
  multiplication,
  division;

  int calculate(int a, int b) {
    switch (this) {
      case Operation.addition:
        return a + b;
      case Operation.subtraction:
        return a - b;
      case Operation.multiplication:
        return a * b;
      case Operation.division:
        // Note: Consider how to handle division carefully due to decimal results
        return a ~/ b; //
    }
  }

  String get symbol {
    switch (this) {
      case Operation.addition:
        return '+';
      case Operation.subtraction:
        return '-';
      case Operation.multiplication:
        return '×';
      case Operation.division:
        return '÷';
    }
  }
}

/*
 * Potential Enhancements:
 * Handle division more carefully to avoid issues with non-integer results (e.g., use floating-point division).
 * Add difficulty levels to control the range of operands.
 * Include better logic for generating wrong options to avoid duplicates or negative numbers.
 */