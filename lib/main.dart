import "package:flutter/material.dart";
import 'no_keyboard_editable_text.dart';

void main() {
    runApp(
        MaterialApp(
            title: "Simple Calculator",
            home: Scaffold(
                appBar: AppBar(
                    title: Text("Simple Calculator"),
                ),
                body: SimpleCalculator(),
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
    String history = "";
    String screen = "";

    var screenTextController = TextEditingController();

    var numberButtonStyle = TextStyle(
        fontSize: 20.0,
        fontWeight: FontWeight.w600
    );
    var signButtonStyle = TextStyle(
        fontSize: 25.0
    );
    var screenStyle = TextStyle(
        fontSize: 45.0,
        color: Colors.black
    );
    var historyStyle = TextStyle(
        fontSize: 16.0
    );

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
                                    textAlign: TextAlign.right,
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
                                    child: Text("^", style: signButtonStyle)
                                ),
                            ),
                            Expanded(
                                child: OutlineButton (
                                    child: Text("√", style: signButtonStyle)
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
                                    child: Text("CE", style: numberButtonStyle)
                                ),
                            ),
                            Expanded(
                                child: OutlineButton (
                                    child: Text("C", style: numberButtonStyle)
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
                                    child: Text("÷", style: signButtonStyle)
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
                                    child: Text("×", style: signButtonStyle)
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
                                    child: Text("−", style: signButtonStyle)
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
                                    child: Text("+", style: signButtonStyle)
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
                                    child: Text("±", style: signButtonStyle)
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
                                    child: Text(".", style: signButtonStyle)
                                ),
                            ),
                            Expanded(
                                child: OutlineButton (
                                    child: Text("=", style: signButtonStyle)
                                ),
                            )
                        ],
                    )
                ),
            ],
        );
    }

    void numberClicked(String number) {
        var insertPosition = screenTextController.selection.start;
        if (insertPosition == -1) {
            setState(() {
                screenTextController.text += number.toString();
            });
        }
        else {
            var currentTextList = screenTextController.text.split('').toList();
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

class AlwaysDisabledFocusNode extends FocusNode {
    @override
    bool get hasFocus => false;
}