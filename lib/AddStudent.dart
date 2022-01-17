import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:student_list/db/StudentModel.dart';
import 'package:student_list/db/database/database.dart';

class AddStudent extends StatelessWidget {
  final _nameController = TextEditingController();
  final _ageController = TextEditingController();
  final _classController = TextEditingController();
  final _addressController = TextEditingController();
  late final image;
  AddStudent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('AddStudent'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              TextFormField(
                controller: _nameController,
                decoration: InputDecoration(
                    border: OutlineInputBorder(), hintText: 'Enter the Name'),
              ),
              SizedBox(
                height: 10,
              ),
              TextFormField(
                controller: _ageController,
                decoration: InputDecoration(
                    border: OutlineInputBorder(), hintText: 'Enter the Age'),
              ),
              SizedBox(
                height: 10,
              ),
              TextFormField(
                controller: _classController,
                decoration: InputDecoration(
                    border: OutlineInputBorder(), hintText: 'Enter the Class'),
              ),
              SizedBox(
                height: 10,
              ),
              TextFormField(
                controller: _addressController,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Enter the Address'),
              ),
              SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: 100,
                    child: ElevatedButton(
                        onPressed: () {
                          imagePick();
                        },
                        child: Row(
                          children: [Icon(Icons.image), Text('Image')],
                        )),
                  ),
                  SizedBox(
                    width: 130,
                    child: ElevatedButton(
                        onPressed: () {
                          addStudentToList();
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [Icon(Icons.save), Text('Submit')],
                        )),
                  ),
                ],
              )
            ],
          ),
        ));
  }

  void addStudentToList() {
    final name = _nameController.text.trim();
    final age = _ageController.text.trim();
    final clas = _classController.text.trim();
    final address = _addressController.text.trim();
    if (name.isEmpty || age.isEmpty || clas.isEmpty || address.isEmpty) {
      return;
      // } else {
      //   print('success');
    } else {
      final stdObj = StudentModel(
          name: name, age: age, clas: clas, address: address, image: image);
      addStudent(stdObj);
    }
  }

  Future<void> imagePick() async {
    try {
      final img = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (img == null) {
        return;
      }
      this.image = img.path;
    } on PlatformException catch (e) {
      print('Failed to pick image : $e');
    }
    print('path is $image');
  }
}
