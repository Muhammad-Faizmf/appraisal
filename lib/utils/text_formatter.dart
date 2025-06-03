import 'package:flutter/services.dart';

class TextFormatter {
  static List<TextInputFormatter>? numberandalphabets = [
    FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z0-9\s]')),
  ];

  static List<TextInputFormatter>? numbersOnly = [
    FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
    FilteringTextInputFormatter.digitsOnly
  ];

  static List<TextInputFormatter>? alphabetsOnly = [
    FilteringTextInputFormatter.deny(RegExp(r'[^a-zA-Z\s]')),
  ];

  static List<TextInputFormatter>? numbersAndDoubleOnly = [
    FilteringTextInputFormatter.allow(RegExp(r'^\d+\.?\d{0,2}')),
  ];

  static List<TextInputFormatter>? numbersAndDoubleWithAddSubtract = [
    FilteringTextInputFormatter.allow(
      RegExp(r'^[-+]?\d*\.?\d{0,2}$'),
    ),
  ];

  static List<TextInputFormatter>? firstLetterCapitalize = [
    FilteringTextInputFormatter.allow(
        RegExp(r'[a-zA-Z0-9 !@#\$%^&*(),.?":{}|<>_\-+=/\\[\]`~]')),
    TextInputFormatter.withFunction((oldValue, newValue) {
      if (newValue.text.isEmpty) return newValue;
      String text = newValue.text;
      String formattedText = text[0].toUpperCase() +
          text.substring(1); // Capitalize first letter only

      return TextEditingValue(
        text: formattedText,
        selection: newValue.selection,
      );
    }),
  ];
}
