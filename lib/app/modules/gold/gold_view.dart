import 'package:flutter/material.dart';

class GoldView extends StatefulWidget {
  const GoldView({super.key});

  @override
  State<GoldView> createState() => _GoldViewState();
}

class _GoldViewState extends State<GoldView> {
  @override
  Widget build(BuildContext context) {
    return const Center(child: Text("Gold"));
  }
}
