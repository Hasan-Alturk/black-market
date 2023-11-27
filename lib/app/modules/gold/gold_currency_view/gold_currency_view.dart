import 'package:flutter/material.dart';

class GoldCurrencyView extends StatefulWidget {
  const GoldCurrencyView({super.key});

  @override
  State<GoldCurrencyView> createState() => _GoldCurrencyViewState();
}

class _GoldCurrencyViewState extends State<GoldCurrencyView> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text("Gold Currency"),
    );
  }
}
