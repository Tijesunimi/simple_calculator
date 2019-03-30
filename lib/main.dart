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
    var buttonStyle = TextStyle(
        fontSize: 19.0
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
                        children: <Widget>[
                            Expanded(
                                child: FlatButton (
                                    child: Text("CE", style: buttonStyle),
                                ),
                            ),
                            Expanded(
                                child: FlatButton (
                                    child: Text("C", style: buttonStyle)
                                ),
                            ),
                            Expanded(
                                child: FlatButton (
                                    child: Icon(Icons.backspace)
                                ),
                            ),
                            Expanded(
                                child: FlatButton (
                                    child: Text("/", style: buttonStyle)
                                ),
                            )
                        ],
                    )
                ),
                Expanded(
                    child: Row(
                        children: <Widget>[
                            Expanded(
                                child: FlatButton (
                                    child: Text("7", style: buttonStyle)
                                ),
                            ),
                            Expanded(
                                child: FlatButton (
                                    child: Text("8", style: buttonStyle)
                                ),
                            ),
                            Expanded(
                                child: FlatButton (
                                    child: Text("9", style: buttonStyle)
                                ),
                            ),
                            Expanded(
                                child: FlatButton (
                                    child: Text("x", style: buttonStyle)
                                ),
                            )
                        ],
                    )
                ),
                Expanded(
                    child: Row(
                        children: <Widget>[
                            Expanded(
                                child: FlatButton (
                                    child: Text("4", style: buttonStyle)
                                ),
                            ),
                            Expanded(
                                child: FlatButton (
                                    child: Text("5", style: buttonStyle)
                                ),
                            ),
                            Expanded(
                                child: FlatButton (
                                    child: Text("6", style: buttonStyle)
                                ),
                            ),
                            Expanded(
                                child: FlatButton (
                                    child: Text(".", style: buttonStyle)
                                ),
                            )
                        ],
                    )
                ),
                Expanded(
                    child: Row(
                        children: <Widget>[
                            Expanded(
                                child: FlatButton (
                                    child: Text("1", style: buttonStyle)
                                ),
                            ),
                            Expanded(
                                child: FlatButton (
                                    child: Text("2", style: buttonStyle)
                                ),
                            ),
                            Expanded(
                                child: FlatButton (
                                    child: Text("3", style: buttonStyle)
                                ),
                            ),
                            Expanded(
                                child: FlatButton (
                                    child: Text("+", style: buttonStyle)
                                ),
                            )
                        ],
                    )
                ),
                Expanded(
                    child: Row(
                        children: <Widget>[
                            Expanded(
                                child: FlatButton (
                                    child: Text("_", style: buttonStyle)
                                ),
                            ),
                            Expanded(
                                child: FlatButton (
                                    child: Text("0", style: buttonStyle)
                                ),
                            ),
                            Expanded(
                                child: FlatButton (
                                    child: Text(".", style: buttonStyle)
                                ),
                            ),
                            Expanded(
                                child: FlatButton (
                                    child: Text("=", style: buttonStyle)
                                ),
                            )
                        ],
                    )
                ),
            ],
        );
    }
}