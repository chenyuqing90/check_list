import 'package:flutter/material.dart';
import 'package:check_list/page/home_page.dart';
import 'package:hive_flutter/adapters.dart';

void main() async{

  runApp(const MyApp());
}

class MyApp extends StatelessWidget{
  const MyApp({super.key});

  @override
  Widget build(BuildContext context){
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
      theme: ThemeData(primarySwatch: Colors.blueGrey),
    );
  }
}