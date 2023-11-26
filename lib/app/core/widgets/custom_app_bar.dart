import 'package:black_market/app/core/constants/app_asset_icons.dart';
import 'package:black_market/app/core/constants/app_colors.dart';
import 'package:black_market/app/core/plugin/plugin_media_que.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    Key? key,
    required this.text,
    required this.onTap,
  }) : super(key: key);

  final String text;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      actions: [
        GestureDetector(
          onTap: onTap,
          child: Image.asset(AppAssetIcons.back),
        ),
      ],
      title: Center(
        child: Text(
          text,
          style: TextStyle(
            color: AppColors.white,
            fontSize: 18*context.textScale,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
      backgroundColor: AppColors.blackNormalHover,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

// Row(
//   children: [
//     const Spacer(flex: 3),
//     Center(
//       child: Text(
//         text,
//         style: TextStyle(
//           color: AppColors.white,
//           fontSize: 18,
//           fontWeight: FontWeight.w700,
//         ),
//         textAlign: TextAlign.center,
//       ),
//     ),
//     const Spacer(flex: 2),
//     Expanded(
//       flex: 1,
//       child: GestureDetector(
//           onTap: onTap, child: Image.asset(AppAssetIcons.back)),
//     )
//   ],
// );
