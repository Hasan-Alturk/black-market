import 'package:black_market/app/core/constants/app_colors.dart';
import 'package:black_market/app/core/plugin/plugin_media_que.dart';
import 'package:flutter/material.dart';

class CustomEditTextField extends StatelessWidget {
  const CustomEditTextField({
    //  required this.controller,
    required this.label,
    required this.icon,
    // required this.onChanged,
    this.validator,
    this.textInputType = TextInputType.text,
    this.obscureText = false,
    this.disable = false,
    this.showBorder = false,
    Key? key,
    required this.text,
  }) : super(key: key);
  //final TextEditingController controller;
  final String label;
  final Image icon;
  final String text;

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
        borderRadius: BorderRadius.circular(11),
      );
    } else {
      return OutlineInputBorder(
        borderSide: BorderSide(color: AppColors.yellowDark),
        borderRadius: BorderRadius.circular(11),
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
              fontSize: 14*context.textScale,
              color: AppColors.graylight,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        SizedBox(
          height: context.screenHeight * 0.015,
        ),
        Directionality(
          textDirection: TextDirection.rtl,
          child: TextFormField(
            //  onChanged: onChanged,
            // controller: controller,
            initialValue: text,
            enabled: !disable,
            keyboardType: textInputType,
            obscureText: obscureText,
            style: TextStyle(
              fontSize: 14*context.textScale,
              color: AppColors.white,
              fontWeight: FontWeight.w700,
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
              fillColor: AppColors.blackNormalHover,
            ),
            validator: validator,
          ),
        ),
      ],
    );
  }
}
