import 'package:black_market/app/modules/favourite/favourite_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FavouriteView extends GetView<FavouriteController> {
  const FavouriteView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: Text("Favorite")),
    );
  }
}
