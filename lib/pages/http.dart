import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:myleddisplaycalculator/model/todo_model.dart';
import 'package:http/http.dart' as http;

class MyHttp extends StatefulWidget {
  const MyHttp({super.key, required this.title});

  final String title;

  @override
  State<MyHttp> createState() => _MyHttpState();
}

class _MyHttpState extends State<MyHttp> {
  Future<List<Map<String, dynamic>?>?> fetchData() async {
    final response =
        await http.get(Uri.parse('https://jsonplaceholder.typicode.com/todos'));

    if (response.statusCode == 200) {
      // Data berhasil diambil
      final data = json.decode(response.body);

      final parsed = List<Map<String, dynamic>>.from(data);
      // log(response.body);
      // Lakukan pengolahan data dan mengembalikan map yang diencode
      return parsed;
    } else {
      // Penanganan kesalahan jika permintaan tidak berhasil
      log('Gagal mengambil data. Status Code: ${response.statusCode}');
      return null;
    }
  }

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
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          fetchTodo();
        },
        child: const Icon(Icons.http),
      ),
    );
  }
}
