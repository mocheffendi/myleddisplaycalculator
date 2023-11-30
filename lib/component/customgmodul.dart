import 'dart:developer';

import 'package:flutter/material.dart';

class MyCustomModul extends StatelessWidget {
  const MyCustomModul(
      {super.key,
      required this.rows,
      required this.columns,
      required this.issquare});

  final int rows;
  final int columns;
  final bool issquare;

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
              double screenHeight = (MediaQuery.of(context).size.height) / 3.2;
              double itemSize = 0;
              double width = 0;
              double height = 0;

              itemSize = (screenWidth / columns < screenHeight / rows)
                  ? screenWidth / columns
                  : screenHeight / rows;

              if (issquare) {
                width = itemSize;
                height = itemSize;
              } else {
                width = itemSize;
                height = itemSize / 1.3;
              }

              return Container(
                // height: MediaQuery.of(context).size.height / rows - 20,
                height: height,
                width: width,
                decoration: BoxDecoration(
                    border: Border.all(
                        color: Theme.of(context).colorScheme.tertiary,
                        width: 1)),
                // color: Colors.amber.shade900,

                // width: MediaQuery.of(context).size.height / rows,
                // color: Colors.primaries[itemNumber % Colors.primaries.length],
                child: Center(
                    child: Text(
                  '$itemNumber',
                  style: const TextStyle(fontSize: 5),
                )),
              );
            }),
          );
        }),
      ),
    );
  }
}
