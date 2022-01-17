import 'package:flutter/material.dart';

class StudentInfo extends StatelessWidget {
  final String name;
  const StudentInfo({Key? key, required this.name}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(name),
      ),
      body: Center(
        child: Text('StudentInfo Page'),
      ),
    );
  }
}
