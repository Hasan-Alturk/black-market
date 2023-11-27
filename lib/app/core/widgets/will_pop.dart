import 'package:flutter/material.dart';

class WillPop extends StatelessWidget {
  const WillPop({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        final value = await showDialog<bool>(
            context: context,
            builder: (builder) {
              return AlertDialog(
                title: const Text("Dialog"),
                content: const Text('Do you want to exit ?'),
                actions: [
                  ElevatedButton(
                      onPressed: () => Navigator.of(context).pop(false),
                      child: const Text('No')),
                  ElevatedButton(
                      onPressed: () => Navigator.of(context).pop(true),
                      child: const Text('Exit')),
                ],
              );
            });
        if (value != null) {
          return Future.value(value);
        } else {
          return Future.value(false);
        }
      },
      child: Scaffold(
        appBar: AppBar(),
      ),
    );
  }
}
