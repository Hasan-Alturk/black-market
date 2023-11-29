import 'package:flutter/material.dart';
import 'package:reorderables/reorderables.dart';


class ColumnExample1State extends StatefulWidget {
  const ColumnExample1State({super.key});

  @override
  State<ColumnExample1State> createState() => _ColumnExample1State();
}

class _ColumnExample1State extends State<ColumnExample1State> {
  late List<Widget> _rows;

  @override
  void initState() {
    super.initState();
    _rows = List<Widget>.generate(
        50,
        (int index) => Text('This is row $index',
            key: ValueKey(index), textScaleFactor: 1.5));
  }

  @override
  Widget build(BuildContext context) {
    void _onReorder(int oldIndex, int newIndex) {
      setState(() {
        Widget row = _rows.removeAt(oldIndex);
        _rows.insert(newIndex, row);
      });
    }

    return ReorderableColumn(
      header: const Text('THIS IS THE HEADER ROW'),
      footer: const Text('THIS IS THE FOOTER ROW'),
      crossAxisAlignment: CrossAxisAlignment.start,
      onReorder: _onReorder,
      children: _rows,
    );
  }
}
