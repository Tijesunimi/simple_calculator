/*
    Workaround to prevent keyboard from displaying when TextField is clicked
    Modified version of: https://github.com/flutter/flutter/issues/16863#issuecomment-457721662
 */

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class NoKeyboardEditableText extends EditableText {

    NoKeyboardEditableText({
        @required TextEditingController controller,
        @required TextStyle style,
        @required Color cursorColor,
        bool autofocus = false,
        Color selectionColor,
        TextAlign textAlign
    }):super(
        controller: controller,
        focusNode: NoKeyboardEditableTextFocusNode(),
        style: style,
        cursorColor: cursorColor,
        autofocus: autofocus,
        selectionColor: selectionColor,
        backgroundCursorColor: Colors.black,
        textAlign: textAlign
    );

    @override
    EditableTextState createState() {
        return NoKeyboardEditableTextState();
    }

}

class NoKeyboardEditableTextState extends EditableTextState {
    @override
    void requestKeyboard() {
        super.requestKeyboard();
        //hide keyboard
        SystemChannels.textInput.invokeMethod('TextInput.hide');
    }
}

class NoKeyboardEditableTextFocusNode extends FocusNode {
    @override
    bool consumeKeyboardToken() {
        // prevents keyboard from showing on first focus
        return false;
    }
}