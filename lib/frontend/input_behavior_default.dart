import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:xterm/frontend/input_behavior.dart';
import 'package:xterm/frontend/input_map.dart';
import 'package:xterm/xterm.dart';

class InputBehaviorDefault extends InputBehavior {
  const InputBehaviorDefault();

  @override
  bool get acceptKeyStroke => true;

  @override
  TextEditingValue get initEditingState => TextEditingValue.empty;

  @override
  bool onKeyStroke(RawKeyEvent event, Terminal terminal) {
    if (event is! RawKeyDownEvent) {
      return false;
    }

    final key = inputMap(event.logicalKey);

    if (key == null) {
      return false;
    }

    return terminal.keyInput(
      key,
      ctrl: event.isControlPressed,
      alt: event.isAltPressed,
      shift: event.isShiftPressed,
      mac: terminal.platform.useMacInputBehavior,
    );
  }

  @override
  TextEditingValue? onTextEdit(TextEditingValue value, Terminal terminal) {
    terminal.onInput(value.text);
    if (value == TextEditingValue.empty || value.text == '') {
      return null;
    } else {
      return TextEditingValue.empty;
    }
  }

  @override
  void onAction(TextInputAction action, Terminal terminal) {
    //
  }
}
