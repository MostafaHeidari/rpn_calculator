import "../inputStack.dart";
import 'commands.dart';


class ClearFunction extends Command<InputStack<dynamic>> {
  @override
  InputStack<dynamic> execute(InputStack<dynamic>? input) {
    input!.clear();

    return input;
  }

  @override
  String getName() {
    return "Clear";
  }

  @override
  String getSymbol() {
    return "C";
  }

  @override
  Type getParamType() {
    return InputStack<num>;
  }
}



