import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
        fixedSize: Size(375.w, 52.h),
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
                fontSize: 16.sp,
                color: textColor,
                fontWeight: FontWeight.w800,
              ),
            ),
    );
  }
}
