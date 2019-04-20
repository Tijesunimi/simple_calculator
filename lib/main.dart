import "package:flutter/material.dart";
import 'no_keyboard_editable_text.dart';
import 'dart:math';

void main() {
    runApp(
        MaterialApp(
            title: "Simple Calculator",
            home: Scaffold(
                appBar: AppBar(
                    title: Text("Simple Calculator"),
                ),
                body: Center(
                    child: SimpleCalculator()
                ),
                resizeToAvoidBottomPadding: false,
            ),
            theme: ThemeData(
                brightness: Brightness.light
            ),
        )
    );
}

class SimpleCalculator extends StatefulWidget {
    @override
    _SimpleCalculatorState createState() => _SimpleCalculatorState();
}

class _SimpleCalculatorState extends State<SimpleCalculator> {
    String history, screen;
    TextEditingController screenTextController;
    TextStyle numberButtonStyle, signButtonStyle, screenStyle, historyStyle;
    double previousTotal;
    Sign currentSign;
    bool isScreenPreviousTotal;
    bool isScreenSquareRoot;
    bool isRaiseToPower;
    double raiseToPowerNumber;

    @override
    void initState() {
        super.initState();

        history = "";
        screen = "";
        screenTextController = new TextEditingController();
        currentSign = Sign.None;
        isScreenPreviousTotal = false;
        isScreenSquareRoot = false;
        isRaiseToPower = false;
        numberButtonStyle = TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.w600
        );
        signButtonStyle = TextStyle(
            fontSize: 25.0
        );
        screenStyle = TextStyle(
            fontSize: 45.0,
            color: Colors.black
        );
        historyStyle = TextStyle(
            fontSize: 23.0
        );
    }

    @override
    Widget build(BuildContext context) {
        return Column (
            children: <Widget>[
                Container(
                    height: 140.0,
                    padding: EdgeInsets.all(20.0),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: <Widget>[
                            Text(
                                history,
                                style: historyStyle,
                                textAlign: TextAlign.right,
                            ),
                            Expanded(
                                child: NoKeyboardEditableText(
                                    controller: screenTextController,
                                    style: screenStyle,
                                    cursorColor: Colors.blueAccent,
                                    textAlign: TextAlign.right
                                )
                            )
                        ],
                    )
                ),
                Expanded(
                    child: Row(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: <Widget>[
                            Expanded(
                                child: OutlineButton (
                                    child: Text("^", style: signButtonStyle),
                                    onPressed:  () => raiseToPowerClicked(),
                                ),
                            ),
                            Expanded(
                                child: OutlineButton (
                                    child: Text("√", style: signButtonStyle),
                                    onPressed: () => squareRootClicked(),
                                ),
                            ),
                            Expanded(
                                child: OutlineButton (
                                    child: Text("(", style: signButtonStyle)
                                ),
                            ),
                            Expanded(
                                child: OutlineButton (
                                    child: Text(")", style: signButtonStyle)
                                ),
                            )
                        ],
                    )
                ),
                Expanded(
                    child: Row(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: <Widget>[
                            Expanded(
                                child: OutlineButton (
                                    child: Text("CE", style: numberButtonStyle),
                                    onPressed: () => clearScreen("CE"),
                                ),
                            ),
                            Expanded(
                                child: OutlineButton (
                                    child: Text("C", style: numberButtonStyle),
                                    onPressed: () => clearScreen("C"),
                                ),
                            ),
                            Expanded(
                                child: OutlineButton (
                                    child: Icon(Icons.backspace),
                                    onPressed: () => backSpaceClicked(),
                                ),
                            ),
                            Expanded(
                                child: OutlineButton (
                                    child: Text("÷", style: signButtonStyle),
                                    onPressed: () {
                                        signClicked("÷");
                                        currentSign = Sign.Division;
                                    }
                                ),
                            )
                        ],
                    )
                ),
                Expanded(
                    child: Row(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: <Widget>[
                            Expanded(
                                child: OutlineButton (
                                    child: Text("7", style: numberButtonStyle),
                                    onPressed: () => numberClicked("7"),
                                ),
                            ),
                            Expanded(
                                child: OutlineButton (
                                    child: Text("8", style: numberButtonStyle),
                                    onPressed: () => numberClicked("8"),
                                ),
                            ),
                            Expanded(
                                child: OutlineButton (
                                    child: Text("9", style: numberButtonStyle),
                                    onPressed: () => numberClicked("9"),
                                ),
                            ),
                            Expanded(
                                child: OutlineButton (
                                    child: Text("×", style: signButtonStyle),
                                    onPressed: () {
                                        signClicked("×");
                                        currentSign = Sign.Multiplication;
                                    }
                                ),
                            )
                        ],
                    )
                ),
                Expanded(
                    child: Row(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: <Widget>[
                            Expanded(
                                child: OutlineButton (
                                    child: Text("4", style: numberButtonStyle),
                                    onPressed: () => numberClicked("4"),
                                ),
                            ),
                            Expanded(
                                child: OutlineButton (
                                    child: Text("5", style: numberButtonStyle),
                                    onPressed: () => numberClicked("5"),
                                ),
                            ),
                            Expanded(
                                child: OutlineButton (
                                    child: Text("6", style: numberButtonStyle),
                                    onPressed: () => numberClicked("6"),
                                ),
                            ),
                            Expanded(
                                child: OutlineButton (
                                    child: Text("−", style: signButtonStyle),
                                    onPressed: () {
                                        signClicked("−");
                                        currentSign = Sign.Subtraction;
                                    }
                                ),
                            )
                        ],
                    )
                ),
                Expanded(
                    child: Row(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: <Widget>[
                            Expanded(
                                child: OutlineButton (
                                    child: Text("1", style: numberButtonStyle),
                                    onPressed: () => numberClicked("1"),
                                ),
                            ),
                            Expanded(
                                child: OutlineButton (
                                    child: Text("2", style: numberButtonStyle),
                                    onPressed: () => numberClicked("2"),
                                ),
                            ),
                            Expanded(
                                child: OutlineButton (
                                    child: Text("3", style: numberButtonStyle),
                                    onPressed: () => numberClicked("3"),
                                ),
                            ),
                            Expanded(
                                child: OutlineButton (
                                    child: Text("+", style: signButtonStyle),
                                    onPressed: () {
                                        signClicked("+");
                                        currentSign = Sign.Addition;
                                    },
                                ),
                            )
                        ],
                    )
                ),
                Expanded(
                    child: Row(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: <Widget>[
                            Expanded(
                                child: OutlineButton (
                                    child: Text("±", style: signButtonStyle),
                                    onPressed: () => plusOrMinusClicked(),
                                ),
                            ),
                            Expanded(
                                child: OutlineButton (
                                    child: Text("0", style: numberButtonStyle),
                                    onPressed: () => numberClicked("0"),
                                ),
                            ),
                            Expanded(
                                child: OutlineButton (
                                    child: Text(".", style: signButtonStyle),
                                    onPressed: () {
                                        if (!screenTextController.text.contains(".")) {
                                            numberClicked(".");
                                        }
                                    },
                                ),
                            ),
                            Expanded(
                                child: OutlineButton (
                                    child: Text("=", style: signButtonStyle),
                                    onPressed: () => equalSignClicked(),
                                ),
                            )
                        ],
                    )
                ),
            ],
        );
    }

    void clearScreen(String type) {
        switch(type) {
            case "CE":
                setState(() {
                    screenTextController.text = "";
                    if (history == "") {
                        previousTotal = null;
                        currentSign = Sign.None;
                    }
                });
                break;
            case "C":
                setState(() {
                    screenTextController.text = "";
                    history = "";
                    previousTotal = null;
                    currentSign = Sign.None;
                });
                break;
        }
    }

    void equalSignClicked() {
        double currentNumber = double.parse(screenTextController.text);
        setState(() {
            previousTotal = getCurrentResult(currentNumber);
            screenTextController.text = previousTotal.toString();
            history = "";
            isScreenPreviousTotal = true;
            currentSign = Sign.None;
        });
    }

    void squareRootClicked() {
        if (screenTextController.text != "") {
            double currentNumber = double.parse(screenTextController.text);
            
            setState(() {
                history += " √${screenTextController.text}";
                previousTotal = getCurrentResult(sqrt(currentNumber), isSquareRoot: true);
                screenTextController.text = previousTotal.toString();
                currentSign = Sign.None;
                isScreenSquareRoot = true;
                isScreenPreviousTotal = true;
            });
        }
    }

    void raiseToPowerClicked() {
        if (screenTextController.text != "") {
            setState(() {
                if (!isRaiseToPower)
                    history += "${screenTextController.text} ^ ";
                else
                    history += " ^ ";
                isRaiseToPower = true;
                isScreenPreviousTotal = true;
                raiseToPowerNumber = double.parse(screenTextController.text);
            });
        }
        else {
            if (currentSign != Sign.None) {
                setState(() {
                    history = history.substring(0, history.length - 3);
                    history += " ^ ";
                    isScreenPreviousTotal = true;
                    isRaiseToPower = true;
                    raiseToPowerNumber = previousTotal;
                });
            }
        }
    }

    void signClicked(String signText) {
        if ((currentSign != Sign.None || isRaiseToPower) && (isScreenPreviousTotal || screenTextController.text == "")) {
            setState(() {
                isRaiseToPower = false;
                history = history.substring(0, history.length - 3);
                history += " $signText ";
            });
        }
        else {
            if (screenTextController.text != "") {
                double currentNumber = double.parse(screenTextController.text);
                setState(() {
                    if (isScreenSquareRoot) {
                        history += " $signText ";
                        isScreenSquareRoot = false;
                    }
                    else {
                        history += "${screenTextController.text} $signText ";
                    }

                    if (previousTotal == null && !isRaiseToPower) {
                        screenTextController.text = "";
                        previousTotal = currentNumber;
                    }
                    else {
                        if (isRaiseToPower) {
                            currentNumber = pow(raiseToPowerNumber, currentNumber);
                            isRaiseToPower = false;
                        }

                        previousTotal = getCurrentResult(currentNumber);
                        screenTextController.text = previousTotal.toString();
                        isScreenPreviousTotal = true;
                    }
                });
            }
        }
    }

    double getCurrentResult(double currentNumber, {bool isSquareRoot = false}) {
        if (previousTotal == null)
            return currentNumber;

        switch (currentSign) {
            case Sign.Addition:
                return previousTotal + currentNumber;
                break;
            case Sign.Subtraction:
                return previousTotal - currentNumber;
                break;
            case Sign.Multiplication:
                return previousTotal * currentNumber;
                break;
            case Sign.Division:
                return previousTotal / currentNumber;
            case Sign.None:
                return isSquareRoot ? currentNumber : previousTotal;
            default:
                return 0.0;
        }
    }

    void plusOrMinusClicked() {
        if (screenTextController.text.length > 0) {
            if (screenTextController.text[0] == "-")
                screenTextController.text = screenTextController.text.replaceFirst("-", "");
            else {
                screenTextController.text = "-${screenTextController.text}";
            }
        }
    }

    void numberClicked(String number) {
        var insertPosition = screenTextController.selection.start;
        if (insertPosition == -1) {
            setState(() {
                if (isScreenPreviousTotal) {
                    screenTextController.text = number.toString();
                    isScreenPreviousTotal = false;
                }
                else
                    screenTextController.text += number.toString();
            });
        }
        else {
            var currentTextList = List<String>();

            if (isScreenPreviousTotal) {
                isScreenPreviousTotal = false;
            }
            else
                currentTextList = screenTextController.text.split('').toList();

            currentTextList.insert(insertPosition, number);
            setState(() {
                screenTextController.text = currentTextList.join('');
                screenTextController.selection = TextSelection.fromPosition(
                    TextPosition(offset: insertPosition + 1)
                );
            });
        }
    }

    void backSpaceClicked() {
        if (screenTextController.text.length > 0) {
            var deletePosition = screenTextController.selection.start;

            if (deletePosition == -1) {
                var currentText = screenTextController.text;
                setState(() {
                    screenTextController.text = currentText.substring(0, currentText.length - 1);
                });
            }
            else {
                var currentTextList = screenTextController.text.split('').toList();
                currentTextList.removeAt(deletePosition - 1);
                setState(() {
                    screenTextController.text = currentTextList.join('');
                    screenTextController.selection = TextSelection.fromPosition(
                        TextPosition(offset: deletePosition - 1)
                    );
                });
            }
        }
    }
}

enum Sign {
    Addition,
    Subtraction,
    Division,
    Multiplication,
    None,
}