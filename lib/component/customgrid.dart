import 'dart:developer';

import 'package:flutter/material.dart';

class MyCustomGrid extends StatelessWidget {
  const MyCustomGrid({super.key, required this.rows, required this.columns});

  final int rows;
  final int columns;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: List.generate(rows, (rowIndex) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: List.generate(columns, (columnIndex) {
              final itemNumber = rowIndex * columns + columnIndex + 1;
              double screenWidth = (MediaQuery.of(context).size.width) / 1.2;
              double screenHeight = (MediaQuery.of(context).size.height) / 2.3;
              double itemSize = (screenWidth / columns < screenHeight / rows)
                  ? screenWidth / columns
                  : screenHeight / rows;
              return Container(
                // height: MediaQuery.of(context).size.height / rows - 20,
                height: itemSize,
                width: itemSize,
                // width: MediaQuery.of(context).size.height / rows,
                color: Colors.primaries[itemNumber % Colors.primaries.length],
                child: Center(child: Text('$itemNumber')),
              );
            }),
          );
        }),
      ),
    );
  }
}
