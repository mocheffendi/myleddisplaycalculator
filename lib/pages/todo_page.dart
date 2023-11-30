import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:myleddisplaycalculator/component/drawer.dart';
import 'package:myleddisplaycalculator/model/todo_model.dart';
import 'package:myleddisplaycalculator/theme/theme_provider.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

class MyTodoPage extends StatefulWidget {
  const MyTodoPage({super.key, required this.title});

  final String title;

  @override
  State<MyTodoPage> createState() => _MyTodoPageState();
}

class _MyTodoPageState extends State<MyTodoPage> {
  List<Todo> todos = [];

  Future<List<Todo>?> fetchTodo() async {
    final response =
        await http.get(Uri.parse('https://jsonplaceholder.typicode.com/todos'));

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      final result = data.map<Todo>((e) => Todo.fromJson(e)).toList();
      return result;
    } else {
      log('Gagal mengambil data. Status Code: ${response.statusCode}');
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: [
          Switch(
            value: Provider.of<ThemeProvider>(context).isDark,
            onChanged: (value) =>
                Provider.of<ThemeProvider>(context, listen: false)
                    .toggleTheme(value),
          ),
        ],
      ),
      drawer: const MyDrawer(),
      body: ListView.builder(
        itemCount: todos.length,
        itemBuilder: (context, index) => ListTile(
          title: Text(todos[index].title),
          trailing: Checkbox(value: todos[index].completed, onChanged: null),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final result = await fetchTodo();
          if (result != null) {
            setState(() {
              todos = result;
            });
          }
        },
        child: const Icon(Icons.http),
      ),
    );
  }
}
