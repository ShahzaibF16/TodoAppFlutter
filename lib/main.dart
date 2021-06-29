import 'package:flutter/material.dart';
import 'home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
 
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      
      home: Scaffold(
        appBar: AppBar(
          title: Center(child: Text("Todo App", style: TextStyle(fontWeight: FontWeight.bold),textAlign: TextAlign.center,)),
          backgroundColor: Colors.black54,
        ),
        body: Todo(),
      ),
    );
  }
}