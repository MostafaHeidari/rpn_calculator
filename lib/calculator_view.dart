import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:rpn_calculator/interface/commands.dart';
import 'inputStack.dart';
import 'interface/all_operations.dart';
import 'interface/clear_function.dart';

class Calculator_View extends StatefulWidget {
  const Calculator_View({super.key});

  @override
  Calculator_ViewState createState() => Calculator_ViewState();
}

class OperationButton extends Material {
  OperationButton(
      {Key? key,
        required String btnText,
        required VoidCallback onPressed,
        Color? btnColor,
        IconData? icon,
        double? size,
        double? weight})
      : super(
    key: key,
    child: Padding(
      padding: const EdgeInsets.only(left: 20),
      child: ButtonTheme(
        shape: const CircleBorder(),
        minWidth: 70,
        height: 70,
        child: MaterialButton(
          onPressed: onPressed,
          color: btnColor,
          child: LayoutBuilder(builder: (p0, p1) {
            if (icon == null) {
              return Text(
                btnText,
                style: const TextStyle(
                  fontWeight: FontWeight.w900,
                  fontSize: 30,
                ),
              );
            }

            return RichText(
              text: TextSpan(children: [
                WidgetSpan(
                  child: Icon(
                    icon,
                    weight: weight,
                  ),
                ),
              ]),
            );
          }
          ),
        ),
      ),
    ),
  );
}

class Calculator_ViewState extends State<Calculator_View> {
  final Color buttonsColor = Colors.grey[900]!;
  final Color buttonsOperationColor = Colors.orange[400]!;

  Command? _currentCommand;
  late InputStack<num> _inputHistory;
  late InputStack<num> _stack;

  num _currentNumber = 0;
  String _alwaysOnScreen = "0";

  Calculator_ViewState() {
    _inputHistory = InputStack();
    _stack = InputStack();
  }

  String? get existenceCalculating {
    if (_currentCommand == null) {
      return "";
    } else {
      return _currentCommand?.getSymbol();
    }
  }

  void addNumber(num number) {
    setState(() {
      if (_currentNumber == 0) {
        _currentNumber = number;
      } else {
        _currentNumber = _currentNumber * 10 + number;
      }
      _alwaysOnScreen = "$_currentNumber $existenceCalculating";
    });
  }

  void enter() {
    setState(() {
      _stack.push(_currentNumber);
      _inputHistory.push(_currentNumber);
      _currentNumber = 0;
      _alwaysOnScreen = "$_currentNumber $existenceCalculating";
    });
  }

  void operator(Command operator) {
    setState(() {
      _currentCommand = operator;
      calculate();
      _alwaysOnScreen = "$_currentNumber $existenceCalculating";
    });
  }

  void calculate() {
    setState(() {
      try {
        _stack = _currentCommand!.execute(_stack);
      } catch (e) {
        if (kDebugMode) {
          print(e);
        }
      }
    });
  }

  void clear() {
    setState(() {
      ClearFunction().execute(_stack);
      ClearFunction().execute(_inputHistory);
      _currentCommand = null;
      _currentNumber = 0;

      _alwaysOnScreen = "0 $existenceCalculating";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text("RPN Calculator"),
        backgroundColor: Colors.black,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              children: [
                Text(
                  _stack.toString(),
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 40,
                    fontWeight: FontWeight.w200,backgroundColor: Colors.black,height: 3,),
                ),
                /*center screen*/
                Align(
                  alignment: Alignment.centerRight,
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Text(
                      _alwaysOnScreen,
                      overflow: TextOverflow.fade,
                      style: const TextStyle(
                          fontSize: 50, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ],
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                OperationButton(
                  btnColor: buttonsColor,
                  btnText: "7",
                  onPressed: () => addNumber(7),
                ),
                OperationButton(
                  btnColor: buttonsColor,
                  btnText: "8",
                  onPressed: () => addNumber(8),
                ),
                OperationButton(
                  btnColor: buttonsColor,
                  btnText: "9",
                  onPressed: () => addNumber(9),
                ),
                OperationButton(
                  onPressed: () => operator(DivisionOperation() as Command),
                  btnColor: buttonsOperationColor,
                  size: 30,
                  btnText: '/',
                  weight: 1000,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                OperationButton(
                  btnColor: buttonsColor,
                  btnText: "4",
                  onPressed: () => addNumber(4),
                ),
                OperationButton(
                  btnColor: buttonsColor,
                  btnText: "5",
                  onPressed: () => addNumber(5),
                ),
                OperationButton(
                  btnColor: buttonsColor,
                  btnText: "6",
                  onPressed: () => addNumber(6),
                ),
                OperationButton(
                  btnText: "x",
                  onPressed: () => operator(MultiplyOperation() as Command),
                  btnColor: buttonsOperationColor,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                OperationButton(
                  btnColor: buttonsColor,
                  btnText: "1",
                  onPressed: () => addNumber(1),
                ),
                OperationButton(
                  btnColor: buttonsColor,
                  btnText: "2",
                  onPressed: () => addNumber(2),
                ),
                OperationButton(
                  btnColor: buttonsColor,
                  btnText: "3",
                  onPressed: () => addNumber(3),
                ),
                OperationButton(
                  btnText: "-",
                  onPressed: () => operator(SubtractionOperation() as Command),
                  btnColor: buttonsOperationColor,
                ),
              ],
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                OperationButton(
                  btnColor: buttonsColor,
                  btnText: "0",
                  onPressed: () => addNumber(0),
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Row(
                    children: [
                      OperationButton(
                        btnText: "C",
                        onPressed: () => clear(),
                        btnColor: Colors.brown[400],
                      ),
                    ],
                  ),
                ),
                OperationButton(
                  btnText: "=",
                  onPressed: () => enter(),
                  btnColor: Colors.brown[400],
                  size: 30,
                ),
                OperationButton(
                  btnText: "+",
                  onPressed: () => operator(AdditionOperation() as Command),
                  btnColor: buttonsOperationColor,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
