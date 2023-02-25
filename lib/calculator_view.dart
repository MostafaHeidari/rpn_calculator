import 'package:flutter/material.dart';

class Calculator_view extends StatefulWidget {
  const Calculator_view({Key? key}) : super(key: key);

  @override
  State<Calculator_view> createState() => _Calculator_viewState();
}

class _Calculator_viewState extends State<Calculator_view> {

  Widget numberButton(String btnText, Color btnColor, Color textColor) {
    return Container(
      child: ElevatedButton(
        onPressed: () {
          calculateMethod(btnText);
        },
        child: SizedBox(
          child: Text(
            btnText,
            style: TextStyle(fontSize: 30, color: textColor),
          ),
        ),
        style: ElevatedButton.styleFrom(
          fixedSize: Size(80, 80),
          backgroundColor: btnColor,
          shape: CircleBorder(),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text("RPN Calculator"),
        backgroundColor: Colors.black87,
      ),
      body: Container(
        padding: EdgeInsets.all(5),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              SizedBox(
                child: Padding(
                  padding: EdgeInsets.all(10.10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Padding(padding: EdgeInsets.all(10.10),
                        child: Text(
                          text,
                          textAlign: TextAlign.left,
                          style: TextStyle(color: Colors.white, fontSize: 70),
                        ),
                      ),
                    ],
                  ),
                ),
              ),



              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  numberButton(
                    "C",
                    (Colors.brown[400])!,
                    Colors.black87,
                  ),
                  numberButton("+/-", (Colors.brown[400])!, Colors.black87),
                  numberButton("%", (Colors.brown[400])!, Colors.black87),
                  numberButton("/", (Colors.brown[400])!, Colors.white),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    numberButton("7", (Colors.grey[900])!, Colors.white),
                    numberButton("8",  Colors.grey[900]!, Colors.white),
                    numberButton("9", Colors.grey[900]!, Colors.white),
                    numberButton("X", Colors.brown[800]!, Colors.white),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    numberButton("4", (Colors.grey[900])!, Colors.white),
                    numberButton("5",  Colors.grey[900]!, Colors.white),
                    numberButton("6", Colors.grey[900]!, Colors.white),
                    numberButton("-", Colors.brown[800]!, Colors.white),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    numberButton("1", (Colors.grey[900])!, Colors.white),
                    numberButton("2",  Colors.grey[900]!, Colors.white),
                    numberButton("3", Colors.grey[900]!, Colors.white),
                    numberButton("+", Colors.brown[800]!, Colors.white),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    numberButton("0", (Colors.grey[900])!, Colors.white),
                    numberButton(".",  Colors.grey[900]!, Colors.white),
                    numberButton("↶", Colors.grey[900]!, Colors.white),
                    numberButton("⏎", Colors.brown[900]!, Colors.white),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  int firstNumber = 0;
  int secondNumber = 0;
  String result = "";
  String text = "";
  String operation = "";

  void calculateMethod(String btnText) {

  }
}


























