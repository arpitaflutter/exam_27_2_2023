import 'dart:io';

import 'package:exam_27_2_2023/model.dart';
import 'package:exam_27_2_2023/var.dart';
import 'package:flutter/material.dart' ;
import 'package:image_picker/image_picker.dart';

class add extends StatefulWidget {
  const add({Key? key}) : super(key: key);

  @override
  State<add> createState() => _addState();
}

class _addState extends State<add> {

  TextEditingController txtname = TextEditingController();
  TextEditingController txtcontact = TextEditingController();
  String path = "";

  @override
  // List<dataModel> l1 = [];
  Widget build(BuildContext context) {

    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            CircleAvatar(
              backgroundImage: FileImage(File("$path")),radius: 50,
            ),
            SizedBox(height: 20,),
            ElevatedButton(onPressed: () async{
              ImagePicker p1 = ImagePicker();
              XFile? xfile = await  p1.pickImage(source: ImageSource.gallery);
              setState(() {
                path = xfile!.path;

              });
            }, child: Text("Gallery")
            ),SizedBox(height: 20,),


            TextField(
              controller: txtname,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20,),
            TextField(
              controller: txtcontact,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20,),
            ElevatedButton(onPressed: () {
              dataModel d1 = dataModel(name: txtname.text,contact: txtcontact.text,image: path);
              setState(() {
                l1.add(d1);
              });
              Navigator.pop(context);

            }, child: Text("Add data")),
          ],
        ),
      ),
    );
  }
}

