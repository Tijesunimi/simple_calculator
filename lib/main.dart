import "package:flutter/material.dart";

void main() {
    runApp(
        MaterialApp(
            title: "Simple Calculator",
            home: Scaffold(
                appBar: AppBar(
                    title: Text("Simple Calculator"),
                ),
                body: SimpleCalculator(),
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
    String history = "72 x 9";
    String screen = "93243";
    var numberButtonStyle = TextStyle(
        fontSize: 20.0,
        fontWeight: FontWeight.w600
    );
    var signButtonStyle = TextStyle(
        fontSize: 25.0
    );
    var screenStyle = TextStyle(
        fontSize: 40.0
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
                            Padding(
                                padding: EdgeInsets.only(top: 10.0),
                                child: Text(
                                    screen,
                                    style: screenStyle,
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
                                    child: Icon(Icons.backspace)
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
                                    child: Text("7", style: numberButtonStyle)
                                ),
                            ),
                            Expanded(
                                child: OutlineButton (
                                    child: Text("8", style: numberButtonStyle)
                                ),
                            ),
                            Expanded(
                                child: OutlineButton (
                                    child: Text("9", style: numberButtonStyle)
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
                                    child: Text("4", style: numberButtonStyle)
                                ),
                            ),
                            Expanded(
                                child: OutlineButton (
                                    child: Text("5", style: numberButtonStyle)
                                ),
                            ),
                            Expanded(
                                child: OutlineButton (
                                    child: Text("6", style: numberButtonStyle)
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
                                    child: Text("1", style: numberButtonStyle)
                                ),
                            ),
                            Expanded(
                                child: OutlineButton (
                                    child: Text("2", style: numberButtonStyle)
                                ),
                            ),
                            Expanded(
                                child: OutlineButton (
                                    child: Text("3", style: numberButtonStyle)
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
                                    child: Text("0", style: numberButtonStyle)
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
}