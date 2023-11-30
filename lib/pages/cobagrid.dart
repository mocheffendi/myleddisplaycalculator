import 'package:flutter/material.dart';
import 'package:myleddisplaycalculator/component/drawer.dart';

class MyGridView extends StatefulWidget {
  const MyGridView({super.key, required this.title});

  final String title;

  @override
  State<MyGridView> createState() => _MyGridViewState();
}

class _MyGridViewState extends State<MyGridView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      drawer: const MyDrawer(),
      body: Center(
        child: SizedBox(
          width: 300,
          height: 600,
          child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
            ),
            itemCount: 6,
            itemBuilder: (BuildContext context, int index) {
              return GridTile(
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black),
                  ),
                  child: Center(
                    child: Text('$index'),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
