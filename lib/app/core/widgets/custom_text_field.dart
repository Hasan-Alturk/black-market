import 'package:black_market/app/core/constants/app_colors.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    //  required this.controller,
    required this.label,
    required this.hint,
    required this.icon,
    // required this.onChanged,
    this.validator,
    this.textInputType = TextInputType.text,
    this.obscureText = false,
    this.disable = false,
    this.showBorder = false,
    Key? key,
  }) : super(key: key);
  //final TextEditingController controller;
  final String label;
  final String hint;
  final Image icon;

  final bool showBorder;
  final bool disable;
  final TextInputType textInputType;
  final bool obscureText;
  final String? Function(String?)? validator;
  //final void Function(String) onChanged;
  OutlineInputBorder outlineInputBorder() {
    if (showBorder) {
      return OutlineInputBorder(
        borderSide: const BorderSide(color: Colors.red),
        borderRadius: BorderRadius.circular(15),
      );
    } else {
      return OutlineInputBorder(
        borderSide: BorderSide.none,
        borderRadius: BorderRadius.circular(15),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Directionality(
          textDirection: TextDirection.rtl,
          child: Text(
            label,
            style: TextStyle(
              fontSize: 14,
              color: AppColors.white,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        const SizedBox(
          height: 15,
        ),
        Directionality(
          textDirection: TextDirection.rtl,
          child: TextFormField(
            //  onChanged: onChanged,
            // controller: controller,
            enabled: !disable,
            keyboardType: textInputType,
            obscureText: obscureText,
            style: TextStyle(
              fontSize: 14,
              color: AppColors.yellowNormal,
              fontWeight: FontWeight.bold,
            ),
            decoration: InputDecoration(
              suffixIcon: icon,
              filled: true,
              enabledBorder: outlineInputBorder(),
              focusedBorder: outlineInputBorder(),
              errorBorder: outlineInputBorder(),
              focusedErrorBorder: outlineInputBorder(),
              disabledBorder: outlineInputBorder(),
              border: outlineInputBorder(),
              fillColor: AppColors.gray,
              hintText: hint,
              hintStyle: TextStyle(
                fontSize: 12,
                color: AppColors.graylight,
                fontWeight: FontWeight.w400,
              ),
            ),
            validator: validator,
          ),
        ),
      ],
    );
  }
}
