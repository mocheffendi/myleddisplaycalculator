import 'package:flutter/material.dart';

class MyCabinet extends StatefulWidget {
  const MyCabinet({super.key});

  @override
  State<MyCabinet> createState() => _MyCabinetState();
}

class _MyCabinetState extends State<MyCabinet> {
  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      child: Center(
        child: Text('LED Display Cabinet'),
      ),
    );
  }
}
