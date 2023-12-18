import 'package:flutter/material.dart';

class MyBox extends StatelessWidget {
  // final Widget? child;
  final Color color;
  // final Text text;
  final String textlabel;
  final String text;
  // final double? height;

  const MyBox({
    super.key,
    // required this.child,
    required this.color,
    required this.textlabel,
    required this.text,
    // required this.height,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Container(
        // height: 75,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: color,
          // boxShadow: [
          //   BoxShadow(
          //     color: Colors.grey.withOpacity(0.5),
          //     spreadRadius: 1,
          //     blurRadius: 3,
          //     offset: const Offset(0, 3),
          //   ),
          // ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            // crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(textlabel
                  // style: labelTextStyleSmall
                  ),
              Text(text, style: const TextStyle(fontWeight: FontWeight.w900)
                  // softWrap: true,
                  ),
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.center,
              //   children: [
              //     // const Icon(Icons.bolt,
              //     //     color: Colors.white),

              //   ],
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
