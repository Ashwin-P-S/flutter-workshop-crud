// ignore_for_file: prefer_const_constructors
// ignore_for_file: prefer_const_literals_to_create_immutables
import 'package:flutter/material.dart';

class Module extends StatefulWidget {
  final formKey;

  const Module({super.key, this.formKey});

  @override
  State<Module> createState() => _ModuleState();
}

class _ModuleState extends State<Module> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:
            Text("Welcome, ${widget.formKey.currentState!.value['Username']}!"),
        backgroundColor: Colors.black,
      ),
      body: SingleChildScrollView(
        child: Container(
          alignment: Alignment.center,
          // child: Text("Hello, Our Sever was busy right now!"),
          child: Column(
            children: [
              Image.asset('assets/images/android.jpg'),
              Image(image: AssetImage("assets/images/android.jpg")),
              Image(image: AssetImage("assets/images/android.jpg")),
              Image(image: AssetImage("assets/images/android.jpg")),
              Image(image: AssetImage("assets/images/android.jpg")),
              Image(image: AssetImage("assets/images/android.jpg")),
              Image(image: AssetImage("assets/images/android.jpg")),
            ],
          ),
        ),
      ),
    );
  }
}
