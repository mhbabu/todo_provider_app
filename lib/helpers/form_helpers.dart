import 'package:flutter/material.dart';

/// 🔹 Reusable helper for showing required field labels
Widget requiredLabel(String text) {
  return RichText(
    text: TextSpan(
      text: text,
      style: const TextStyle(
        color: Colors.grey, // label base color
        fontSize: 16,
      ),
      children: const [
        TextSpan(
          text: ' *',
          style: TextStyle(
            color: Colors.red, // red star for required
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    ),
  );
}
