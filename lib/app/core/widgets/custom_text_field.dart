import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String title;
  final String text;
  final bool obscureText;
  final TextInputType inputType;
  final IconButton icon;

  const CustomTextField({
    super.key,
    required this.title,
    required this.text,
    required this.obscureText,
    required this.inputType,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: Directionality(
          textDirection: TextDirection.rtl,
          child: TextField(
            style: Theme.of(context).textTheme.labelMedium,
            keyboardType: inputType,
            obscureText: obscureText,
            cursorColor: Theme.of(context).primaryColor,
            textAlign: TextAlign.right,
            decoration: InputDecoration(
                suffixIcon: icon,
                labelText: text,
                labelStyle: Theme.of(context).textTheme.displayMedium,
                contentPadding: const EdgeInsets.all(16),
                focusedBorder:
                    Theme.of(context).inputDecorationTheme.focusedBorder,
                enabledBorder:
                    Theme.of(context).inputDecorationTheme.enabledBorder),
          )),
    );
  }
}
