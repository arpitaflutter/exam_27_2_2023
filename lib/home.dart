import 'dart:io';

import 'package:exam_27_2_2023/model.dart';
import 'package:exam_27_2_2023/var.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:url_launcher/url_launcher.dart';

class home extends StatefulWidget {
  const home({Key? key}) : super(key: key);

  @override

  State<home> createState() => _homeState();
}

class _homeState extends State<home> {


  TextEditingController txtn1 = TextEditingController();
  TextEditingController txtc1 = TextEditingController();

  @override


  Widget build(BuildContext context) {

    // List<dataModel> d1 = ModalRoute.of(context)!.settings.arguments as List<dataModel>;

    return SafeArea(
      child: Scaffold(
        body: Column(
          // mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              height: 100,width: double.infinity,color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Row(
                  children: [
                    Icon(Icons.arrow_back,color: Colors.grey),
                    Spacer(),
                    Icon(Icons.menu,color: Colors.grey),
                  ],
                ),
              ),
            ),
            Container(
              height: 200,width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.grey.shade300
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Text("MY CONTACTS",style: TextStyle(color: Colors.grey,),),
                      )
                    ],
                  ),
                  Container(
                    height: 50,width: double.infinity,
                    margin: EdgeInsets.all(15),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey,
                          blurRadius: 2,spreadRadius: 2,offset: Offset(0,2)
                        )
                      ],
                    ),
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Text("Type name of number",style: TextStyle(fontSize: 15,color: Colors.grey)),
                        ),
                        Spacer(),
                        Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Icon(Icons.search,color: Colors.grey,),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListView.builder(itemBuilder:
                  (context, index) => theme(l1[index]),
                itemCount: l1.length,
              ),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(backgroundColor: Colors.blue,
          onPressed: () {
            Navigator.pushNamed(context, 'add').then((_){
              setState(() {});
            });
          },child: Icon(Icons.add,color: Colors.white),
        ),
      ),
    );
  }


  Widget theme(dataModel l2)
  {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Container(
        height: 100,width: double.infinity,
        child: Row(
          children: [
            CircleAvatar(
              backgroundImage: FileImage(File("${l2.image}")),radius: 30,
            ),
            SizedBox(height: 20,),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  Text("${l2.name}"),
                  SizedBox(height: 10,),
                  Text("${l2.contact}"),
                ],
              ),
            ),
            Spacer(),
            IconButton(onPressed: () {
              setState(() {
                launchUrl(Uri.parse("tel:+1-555-010-999"));
              });
            }, icon: Icon(Icons.call)),
            IconButton(onPressed: () {
              setState(() {
                launchUrl(Uri.parse("sms:5550101234"));
              });
            }, icon: Icon(Icons.message))
          ],
        ),
      ),
    );
  }

}
