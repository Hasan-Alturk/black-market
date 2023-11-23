import 'package:black_market/app/core/constants/app_colors.dart';
import 'package:flutter/material.dart';

class StateButton extends StatelessWidget {
  const StateButton({
    Key? key,
    required this.isLoading,
    required this.text,
    required this.onPressed,
    required this.buttonColor,
    required this.radius,
  }) : super(key: key);
  final bool isLoading;
  final String text;
  final void Function() onPressed;
  final Color? buttonColor;
  final double radius;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: buttonColor,
        fixedSize: const Size(200, 50),
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
                fontSize: 16,
                color: AppColors.blackDark,
                fontWeight: FontWeight.w800,
              ),
            ),
    );
  }
}
