// import 'dart:io';

// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:hive_flutter/adapters.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:student_list/db/StudentModel.dart';
// import 'package:student_list/db/database/database.dart';

// class EditStudent extends StatefulWidget {
//   String data;
//   int index;
//   EditStudent({Key? key, required this.data, required this.index})
//       : super(key: key);

//   @override
//   State<EditStudent> createState() => _EditStudentState();
// }

// class _EditStudentState extends State<EditStudent> {
//   final _nameController = TextEditingController();

//   final _ageController = TextEditingController();

//   final _classController = TextEditingController();

//   final _addressController = TextEditingController();

//   late final image;

//   @override
//   Widget build(BuildContext context) {
//     print(widget.data);
//     return Scaffold(
//         appBar: AppBar(
//           title: Text('AddStudent'),
//         ),
//         body: Padding(
//           padding: const EdgeInsets.all(20),
//           child: Column(
//             children: [
//               TextFormField(
//                 initialValue: widget.data,
//                 //controller: _nameController,
//                 decoration: InputDecoration(
//                     border: OutlineInputBorder(), hintText: 'Enter the Name'),
//                 onChanged: (value) {
//                   final result = Hive.openBox<StudentModel>('student');

//                   setState(() {
//                     widget.data = value;
//                   });
//                 },
//               ),
//               SizedBox(
//                 height: 10,
//               ),
//               TextFormField(
//                 //initialValue: data!.age,
//                 //controller: _ageController,
//                 decoration: InputDecoration(
//                     border: OutlineInputBorder(), hintText: 'Enter the Age'),
//               ),
//               SizedBox(
//                 height: 10,
//               ),
//               TextFormField(
//                 //initialValue: data!.clas,

//                 //controller: _classController,
//                 decoration: InputDecoration(
//                     border: OutlineInputBorder(), hintText: 'Enter the Class'),
//               ),
//               SizedBox(
//                 height: 10,
//               ),
//               TextFormField(
//                 //initialValue: data!.address,
//                 //controller: _addressController,
//                 decoration: InputDecoration(
//                     border: OutlineInputBorder(),
//                     hintText: 'Enter the Address'),
//               ),
//               SizedBox(
//                 height: 30,
//               ),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   SizedBox(
//                     width: 100,
//                     child: ElevatedButton(
//                         onPressed: () {
//                           simpleDialog(context);
//                         },
//                         child: Row(
//                           children: [Icon(Icons.image), Text('Image')],
//                         )),
//                   ),
//                   SizedBox(
//                     width: 130,
//                     child: ElevatedButton(
//                         onPressed: () {},
//                         child: Row(
//                           mainAxisAlignment: MainAxisAlignment.center,
//                           children: [Icon(Icons.save), Text('Submit')],
//                         )),
//                   ),
//                 ],
//               )
//             ],
//           ),
//         ));
//   }

//   Future<void> imagePickFromGallery() async {
//     try {
//       final img = await ImagePicker().pickImage(source: ImageSource.gallery);
//       if (img == null) {
//         return;
//       }
//       this.image = img.path;
//     } on PlatformException catch (e) {
//       print('Failed to pick image : $e');
//     }
//     print('path is $image');
//   }

//   Future<void> imagePickFromCamera() async {
//     try {
//       final img = await ImagePicker().pickImage(source: ImageSource.camera);
//       if (img == null) {
//         return;
//       }
//       this.image = img.path;
//     } on PlatformException catch (e) {
//       print('Failed to pick image : $e');
//     }
//     print('path is $image');
//   }

//   void simpleDialog(BuildContext ctx) {
//     showDialog(
//         context: ctx,
//         builder: (ctx) => SimpleDialog(
//               title: Text('choose'),
//               children: [
//                 SimpleDialogOption(
//                   onPressed: () {
//                     imagePickFromGallery();
//                     Navigator.pop(ctx);
//                   },
//                   child: Text('Gallery'),
//                 ),
//                 SimpleDialogOption(
//                   onPressed: () {
//                     imagePickFromCamera();
//                     Navigator.pop(ctx);
//                   },
//                   child: Text('Camera'),
//                 )
//               ],
//             ));
//   }
// }
