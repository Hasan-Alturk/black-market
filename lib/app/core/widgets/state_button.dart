import 'package:black_market/app/core/plugin/plugin_media_que.dart';
import 'package:flutter/material.dart';

class StateButton extends StatelessWidget {
  const StateButton({
    Key? key,
    required this.isLoading,
    required this.text,
    required this.onPressed,
    required this.buttonColor,
    required this.radius,
    required this.textColor,
  }) : super(key: key);
  final bool isLoading;
  final String text;
  final void Function() onPressed;
  final Color buttonColor;
  final double radius;
  final Color textColor;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: buttonColor,
        fixedSize: Size(context.screenWidth, context.screenHeight * 0.065),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(radius),
        ),
      ),
      onPressed: isLoading ? null : onPressed,
      child: isLoading
          ? const CircularProgressIndicator()
          : Text(
              text,
              style: TextStyle(
                fontSize: 16 * context.textScale,
                color: textColor,
                fontWeight: FontWeight.w800,
              ),
            ),
    );
  }
}
