import 'dart:math';

void main() {
  final questions = generateRandomQuestions();

  for (var question in questions) {
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
}

/// Generates a list of 10 random math questions with varying operations and options.
List<Question> generateRandomQuestions() {
  final Random random = Random();
  final List<Question> questions = [];

  for (int i = 1; i <= 10; i++) {
    final operation = Operation.values[random.nextInt(Operation.values.length)];
    final operand1 = random.nextInt(50) + 1;
    final operand2 = random.nextInt(50) + 1;
    final result = operation.calculate(operand1, operand2);

    // Generate 4 options, one of which is the correct answer
    final options = [
      {"a": result},
      {"b": result + random.nextInt(6) + 1},
      {"c": result - random.nextInt(6) + 1},
      {"d": result + random.nextInt(6) + 1},
    ]..shuffle();

    questions.add(Question(
      operand1: operand1,
      operand2: operand2,
      operation: operation,
      questionNumber: i,
      options: options,
    ));
  }

  return questions;
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
