import '../inputStack.dart';
import 'commands.dart';

class AdditionOperation implements Command<InputStack<num>> {
  @override
  String getName() {
    return "Addition";
  }

  @override
  String getSymbol() {
    return "+";
  }

  @override
  Type getParamType() {
    return num;
  }

  @override
  InputStack<num> execute(InputStack<num> input) {
    if (!input.isEmpty) {
      num a = input.pop();
      num b = input.pop();

      num result = a + b;

      input.push(result);
    }

    return input;
  }
}

class SubtractionOperation implements Command<InputStack<num>> {
  @override
  String getName() {
    return "Subtraction";
  }

  @override
  String getSymbol() {
    return "-";
  }

  @override
  Type getParamType() {
    return num;
  }

  @override
  InputStack<num> execute(InputStack<num> input) {
    if (!input.isEmpty) {
      num a = input.pop();
      num b = input.pop();

      num result = a - b;

      input.push(result);
    }

    return input;
  }
}

class MultiplyOperation implements Command<InputStack<num>> {
  @override
  String getName() {
    return "Multiplication";
  }

  @override
  String getSymbol() {
    return "*";
  }

  @override
  Type getParamType() {
    return num;
  }

  @override
  InputStack<num> execute(InputStack<num> numberStack) {
    if (!numberStack.isEmpty) {
      num a = numberStack.pop();
      num b = numberStack.pop();

      num result = a * b;

      numberStack.push(result);
    }

    return numberStack;
  }
}

class DivisionOperation implements Command<InputStack<num>> {
  @override
  String getName() {
    return "Division";
  }

  @override
  String getSymbol() {
    return "/";
  }

  @override
  Type getParamType() {
    return num;
  }

  @override
  InputStack<num> execute(InputStack<num> input) {
    if (!input.isEmpty) {
      num a = input.pop();
      num b = input.pop();

      num result = b / a;

      input.push(result);
    }

    return input;
  }
}
