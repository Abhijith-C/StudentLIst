import 'dart:io';

import 'package:flutter/material.dart';
import 'package:student_list/AddStudent.dart';
import 'package:student_list/StudentInfo.dart';
import 'package:student_list/db/database/database.dart';

import 'db/StudentModel.dart';

class HomePage extends StatelessWidget {
  final _searchController = TextEditingController();
  //StudentModel? data1;
  HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Home Page')),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(30),
            child: TextFormField(
              controller: _searchController,
              onChanged: (value) {
                search(value);
              },
              decoration: InputDecoration(
                  border: OutlineInputBorder(), hintText: 'search...'),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(top: 15, bottom: 5),
              child: ValueListenableBuilder(
                valueListenable: studentList,
                builder: (BuildContext ctx, List<StudentModel> newStudentList,
                    Widget? child) {
                  return ListView.separated(
                      itemBuilder: (ctx, index) {
                        final data = newStudentList[index];
                        //this.data1 = data;
                        return ListTile(
                          onTap: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (ctx) => StudentInfo(
                                        name: data.name,
                                        age: data.age,
                                        clas: data.clas,
                                        address: data.address,
                                        image: data.image,
                                      ))),
                          title: Text(data.name),
                          leading: CircleAvatar(
                            backgroundImage: Image.file(File(data.image)).image,
                            radius: 50,
                          ),
                          trailing: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              IconButton(
                                  onPressed: () {
                                    Navigator.of(context)
                                        .push(MaterialPageRoute(
                                            builder: (ctx) => AddStudent(
                                                  data: data,
                                                )));
                                  },
                                  icon: Icon(
                                    Icons.edit,
                                    color: Colors.blue,
                                  )),
                              IconButton(
                                  onPressed: () {
                                    if (data.id != null)
                                      deleteStudent(data.id!);
                                    else
                                      print('id is null');
                                  },
                                  icon: Icon(
                                    Icons.delete,
                                    color: Colors.red,
                                  )),
                            ],
                          ),
                        );
                      },
                      separatorBuilder: (ctx, index) => Divider(),
                      itemCount: newStudentList.length);
                },
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (ctx) => AddStudent(
                        //data: data1,
                      )));
        },
        child: Icon(Icons.add),
      ),
    );
  }

  void search(value) {}
}
