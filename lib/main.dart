import 'package:exam_27_2_2023/add.dart';
import 'package:flutter/material.dart';

import 'home.dart';

void main()
{
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/':(context) => home(),
        'add':(context) => add(),
      },
    ),
  );
}