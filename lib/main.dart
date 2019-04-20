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
                brightness: Brightness.light,
                primaryColor: Colors.deepPurpleAccent
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
    TextStyle numberButtonTextStyle, signButtonTextStyle, screenTextStyle, historyTextStyle;
    Color signButtonBgColor, numberButtonBgColor;
    RoundedRectangleBorder buttonBorderShape;
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
        numberButtonTextStyle = TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.w600,
        );
        signButtonTextStyle = TextStyle(
            fontSize: 25.0,
        );
        buttonBorderShape = RoundedRectangleBorder(
            side: BorderSide(color: Color.fromRGBO(216, 216, 216, 1.0))
        );
        signButtonBgColor = Colors.amberAccent;
        numberButtonBgColor = Colors.white;
        screenTextStyle = TextStyle(
            fontSize: 45.0,
            color: Colors.black
        );
        historyTextStyle = TextStyle(
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
                                style: historyTextStyle,
                                textAlign: TextAlign.right,
                            ),
                            Expanded(
                                child: NoKeyboardEditableText(
                                    controller: screenTextController,
                                    style: screenTextStyle,
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
                                child: RaisedButton(
                                    child: Text("^", style: signButtonTextStyle),
                                    onPressed:  () => raiseToPowerClicked(),
                                    color: signButtonBgColor,
                                    shape: buttonBorderShape,
                                ),
                            ),
                            Expanded(
                                child: RaisedButton(
                                    child: Text("√", style: signButtonTextStyle),
                                    onPressed: () => squareRootClicked(),
                                    color: signButtonBgColor,
                                    shape: buttonBorderShape,
                                ),
                            ),
                            Expanded(
                                child: RaisedButton(
                                    child: Text("(", style: signButtonTextStyle),
                                    color: signButtonBgColor,
                                    disabledColor: signButtonBgColor,
                                    shape: buttonBorderShape,
                                ),
                            ),
                            Expanded(
                                child: RaisedButton(
                                    child: Text(")", style: signButtonTextStyle),
                                    color: signButtonBgColor,
                                    disabledColor: signButtonBgColor,
                                    shape: buttonBorderShape,
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
                                child: RaisedButton (
                                    child: Text("CE", style: numberButtonTextStyle),
                                    shape: buttonBorderShape,
                                    color: numberButtonBgColor,
                                    onPressed: () => clearScreen("CE"),
                                ),
                            ),
                            Expanded(
                                child: RaisedButton (
                                    child: Text("C", style: numberButtonTextStyle),
                                    shape: buttonBorderShape,
                                    color: numberButtonBgColor,
                                    onPressed: () => clearScreen("C"),
                                ),
                            ),
                            Expanded(
                                child: RaisedButton (
                                    child: Icon(Icons.backspace),
                                    shape: buttonBorderShape,
                                    color: numberButtonBgColor,
                                    onPressed: () => backSpaceClicked(),
                                ),
                            ),
                            Expanded(
                                child: RaisedButton(
                                    child: Text("÷", style: signButtonTextStyle),
                                    color: signButtonBgColor,
                                    shape: buttonBorderShape,
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
                                child: RaisedButton (
                                    child: Text("7", style: numberButtonTextStyle),
                                    shape: buttonBorderShape,
                                    color: numberButtonBgColor,
                                    onPressed: () => numberClicked("7"),
                                ),
                            ),
                            Expanded(
                                child: RaisedButton (
                                    child: Text("8", style: numberButtonTextStyle),
                                    shape: buttonBorderShape,
                                    color: numberButtonBgColor,
                                    onPressed: () => numberClicked("8"),
                                ),
                            ),
                            Expanded(
                                child: RaisedButton (
                                    child: Text("9", style: numberButtonTextStyle),
                                    shape: buttonBorderShape,
                                    color: numberButtonBgColor,
                                    onPressed: () => numberClicked("9"),
                                ),
                            ),
                            Expanded(
                                child: RaisedButton (
                                    child: Text("×", style: signButtonTextStyle),
                                    color: signButtonBgColor,
                                    shape: buttonBorderShape,
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
                                child: RaisedButton (
                                    child: Text("4", style: numberButtonTextStyle),
                                    shape: buttonBorderShape,
                                    color: numberButtonBgColor,
                                    onPressed: () => numberClicked("4"),
                                ),
                            ),
                            Expanded(
                                child: RaisedButton (
                                    child: Text("5", style: numberButtonTextStyle),
                                    shape: buttonBorderShape,
                                    color: numberButtonBgColor,
                                    onPressed: () => numberClicked("5"),
                                ),
                            ),
                            Expanded(
                                child: RaisedButton (
                                    child: Text("6", style: numberButtonTextStyle),
                                    color: numberButtonBgColor,
                                    shape: buttonBorderShape,
                                    onPressed: () => numberClicked("6"),
                                ),
                            ),
                            Expanded(
                                child: RaisedButton (
                                    child: Text("−", style: signButtonTextStyle),
                                    color: signButtonBgColor,
                                    shape: buttonBorderShape,
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
                                child: RaisedButton (
                                    child: Text("1", style: numberButtonTextStyle),
                                    color: numberButtonBgColor,
                                    onPressed: () => numberClicked("1"),
                                    shape: buttonBorderShape,
                                ),
                            ),
                            Expanded(
                                child: RaisedButton (
                                    child: Text("2", style: numberButtonTextStyle),
                                    color: numberButtonBgColor,
                                    onPressed: () => numberClicked("2"),
                                    shape: buttonBorderShape,
                                ),
                            ),
                            Expanded(
                                child: RaisedButton (
                                    child: Text("3", style: numberButtonTextStyle),
                                    color: numberButtonBgColor,
                                    onPressed: () => numberClicked("3"),
                                    shape: buttonBorderShape,
                                ),
                            ),
                            Expanded(
                                child: RaisedButton (
                                    child: Text("+", style: signButtonTextStyle),
                                    color: signButtonBgColor,
                                    shape: buttonBorderShape,
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
                                child: RaisedButton (
                                    child: Text("±", style: signButtonTextStyle),
                                    color: numberButtonBgColor,
                                    shape: buttonBorderShape,
                                    onPressed: () => plusOrMinusClicked(),
                                ),
                            ),
                            Expanded(
                                child: RaisedButton (
                                    child: Text("0", style: numberButtonTextStyle),
                                    color: numberButtonBgColor,
                                    shape: buttonBorderShape,
                                    onPressed: () => numberClicked("0"),
                                ),
                            ),
                            Expanded(
                                child: RaisedButton (
                                    child: Text(".", style: signButtonTextStyle),
                                    color: numberButtonBgColor,
                                    shape: buttonBorderShape,
                                    onPressed: () {
                                        if (!screenTextController.text.contains(".")) {
                                            numberClicked(".");
                                        }
                                    },
                                ),
                            ),
                            Expanded(
                                child: RaisedButton (
                                    child: Text("=", style: signButtonTextStyle),
                                    onPressed: () => equalSignClicked(),
                                    color: signButtonBgColor,
                                    shape: buttonBorderShape,
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
            screenTextController.text = removeTrailingZero(previousTotal);
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
                screenTextController.text = removeTrailingZero(previousTotal);
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
                        screenTextController.text = removeTrailingZero(previousTotal);
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

    String removeTrailingZero(double number) {
        return number.toStringAsFixed(number.truncateToDouble() == number ? 0 : 1);
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