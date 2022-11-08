// ignore_for_file: prefer_const_constructors, non_constant_identifier_names, avoid_print
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Welcome!"),
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Form(),
      ),
    );
  }
}

class Form extends StatefulWidget {
  const Form({super.key});

  @override
  State<Form> createState() => _FormState();
}

class _FormState extends State<Form> {
  TextEditingController Name = TextEditingController();
  TextEditingController Age = TextEditingController();
  TextEditingController Email = TextEditingController();
  TextEditingController Mobile = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      // ignore: prefer_const_literals_to_create_immutables
      children: [
        TextField(
          decoration: InputDecoration(hintText: "Name"),
          controller: Name,
        ),
        TextField(
          decoration: InputDecoration(hintText: "Age"),
          controller: Age,
        ),
        TextField(
          decoration: InputDecoration(hintText: "Email"),
          controller: Email,
        ),
        TextField(
          decoration: InputDecoration(hintText: "Mobile"),
          controller: Mobile,
        ),
        SizedBox(height: 40),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                // ignore: prefer_interpolation_to_compose_strings
                print("\nName: " +
                    Name.text +
                    "\nAge: " +
                    Age.text +
                    "\nEmail: " +
                    Email.text +
                    "\nMobile: " +
                    Mobile.text);
              },
              child: Text("Submit"),
            ),
            SizedBox(width: 20),
            ElevatedButton(
              onPressed: () {
                Name.text = "";
                Age.text = "";
                Email.text = "";
                Mobile.text = "";
              },
              child: Text("Clear"),
            ),
          ],
        )
      ],
    );
  }
}
