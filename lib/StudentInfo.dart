import 'dart:io';

import 'package:flutter/material.dart';

class StudentInfo extends StatelessWidget {
  final String name;
  final String age;
  final String clas;
  final String address;
  final String image;
  const StudentInfo(
      {Key? key,
      required this.name,
      required this.age,
      required this.clas,
      required this.address,
      required this.image})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Student Info'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(40),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(10),
              child: CircleAvatar(
                radius: 140,
                backgroundImage: Image.file(File(image)).image,
              ),
            ),
            Column(
              children: [
                Text(
                  name,
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 30,
                ),
                Text(
                  'Age : $age',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
                ),
                Text(
                  'Class : $clas',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
                ),
                Text(
                  'Address : $address',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
