import 'package:flutter/material.dart';

class MyGridBuilder extends StatelessWidget {
  const MyGridBuilder(
      {super.key,
      required this.row,
      required this.column,
      required this.widthpixels,
      required this.heightpixels});

  final int row;
  final int column;
  final int widthpixels;
  final int heightpixels;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(50, 10, 50, 10),
        child: GridView.builder(
          shrinkWrap: true,
          physics: const ScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: row,
          ),
          itemCount: column * row,
          itemBuilder: (BuildContext context, int index) {
            int itemindex = index + 1;
            return GridTile(
              child: Container(
                decoration: BoxDecoration(
                    // color: Theme.of(context).colorScheme.primary,
                    border: Border.all(color: Colors.black)),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('$itemindex'),
                      Text(
                        '$widthpixels*$heightpixels',
                        style: const TextStyle(fontSize: 6),
                      )
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
