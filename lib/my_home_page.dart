import 'package:flutter/material.dart';
import 'package:interview_template/my_object.dart';

class MyHomePage extends StatelessWidget {
  MyHomePage({super.key});

  final myObject = MyObject.create();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cat-alogue'),
      ),
      body: Container(),
    );
  }
}
