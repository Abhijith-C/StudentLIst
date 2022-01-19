import 'dart:async';
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
  late final _image;
  StudentModel? data;
  AddStudent({Key? key, this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (data != null) {
      _nameController.text = data!.name;
      _ageController.text = data!.age;
      _classController.text = data!.clas;
      _addressController.text = data!.address;
      //_image = data!.image;
    }
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
                          simpleDialog(context);
                        },
                        child: Row(
                          children: [Icon(Icons.image), Text('Image')],
                        )),
                  ),
                  SizedBox(
                    width: 130,
                    child: ElevatedButton(
                        onPressed: () {
                          if (data == null)
                            addStudentToList();
                          else
                            updateStudentToList(data!.id!);
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

  Future<void> imagePickFromGallery() async {
    try {
      final img = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (img == null) {
        return;
      }
      this._image = img.path;
    } on PlatformException catch (e) {
      print('Failed to pick image : $e');
    }
    print('path is $_image');
  }

  Future<void> imagePickFromCamera() async {
    try {
      final img = await ImagePicker().pickImage(source: ImageSource.camera);
      if (img == null) {
        return;
      }
      this._image = img.path;
    } on PlatformException catch (e) {
      print('Failed to pick image : $e');
    }
    print('path is $_image');
  }

  void simpleDialog(BuildContext ctx) {
    showDialog(
        context: ctx,
        builder: (ctx) => SimpleDialog(
              title: Text('choose'),
              children: [
                SimpleDialogOption(
                  onPressed: () {
                    imagePickFromGallery();
                    Navigator.pop(ctx);
                  },
                  child: Text('Gallery'),
                ),
                SimpleDialogOption(
                  onPressed: () {
                    imagePickFromCamera();
                    Navigator.pop(ctx);
                  },
                  child: Text('Camera'),
                )
              ],
            ));
  }

  void addStudentToList() {
    final name = _nameController.text.trim();
    final age = _ageController.text.trim();
    final clas = _classController.text.trim();
    final address = _addressController.text.trim();
    final image = _image;
    if (name.isEmpty ||
        age.isEmpty ||
        clas.isEmpty ||
        address.isEmpty ||
        image == null) {
      return;
      // } else {
      //   print('success');
    } else {
      final stdObj = StudentModel(
          name: name, age: age, clas: clas, address: address, image: image);
      addStudent(stdObj);
    }
  }

  void updateStudentToList(int id) {
    final name = _nameController.text;
    final age = _ageController.text;
    final clas = _classController.text;
    final address = _addressController.text;
    final image = _image;
    final stdObj = StudentModel(
        name: name,
        age: age,
        clas: clas,
        address: address,
        image: image,
        id: id);
    updateStudent(id, stdObj);
    print('111111111111111111111111......................$_image');
  }
}
