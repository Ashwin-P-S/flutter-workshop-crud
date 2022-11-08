// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
// import 'package:weather/next_page.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Home(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _count = 0;
  Color myColor = Colors.red;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            "Home",
            style: TextStyle(color: Colors.white),
          ),
        ),
        backgroundColor: myColor,
      ),
      body: Container(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("You've Pressed the Button this many times"),
            Text(
              "$_count",
              style: TextStyle(fontSize: 40),
            ),
          ],
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FloatingActionButton(
            backgroundColor: Colors.red,
            onPressed: () {
              setState(() {
                myColor = Colors.red;
                _count++;
              });
            },
            child: Text(
              "Red",
              style: TextStyle(color: Colors.white),
            ),
          ),
          const Padding(padding: EdgeInsets.all(10)),
          FloatingActionButton(
            backgroundColor: Colors.green,
            onPressed: () {
              setState(() {
                myColor = Colors.green;
                _count++;
              });
            },
            child: Text(
              "Green",
              style: TextStyle(color: Colors.white),
            ),
          ),
          const Padding(padding: EdgeInsets.all(10)),
          FloatingActionButton(
            backgroundColor: Colors.blue,
            onPressed: () {
              setState(() {
                myColor = Colors.blue;
                _count++;
              });
            },
            child: Text(
              "Blue",
              style: TextStyle(color: Colors.white),
            ),
          ),
          const Padding(padding: EdgeInsets.all(10)),
          // FloatingActionButton(
          //   onPressed: () {
          //     Navigator.push(
          //         context,
          //         MaterialPageRoute(
          //             builder: (context) => SecondPage(
          //                   count: _count,
          //                 )));
          //   },
          //   tooltip: "Button Properties",
          //   child: Icon(Icons.arrow_right),
          // )
        ],
      ),
    );
  }
}
