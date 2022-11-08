// ignore_for_file: prefer_const_constructors, avoid_print
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:weather/push_data.dart';

FirebaseOptions get fireBaseOptions => const FirebaseOptions(
      apiKey: "AIzaSyATpFxRrzbjnKvmdK7gAuuQFQ7clXLA0tI",
      appId: "1:41257800874:android:30c0bc241915d5f5706cd3",
      messagingSenderId: "41257800874",
      projectId: "weather-ashwi",
    );

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: fireBaseOptions);
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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
  final _formKey = GlobalKey<FormBuilderState>();
  CollectionReference records =
      FirebaseFirestore.instance.collection('records');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: ListTile(
          title: Text("Inbox"),
        ),
      ),
      appBar: AppBar(title: Text("Home")),
      body: Padding(
        padding: EdgeInsets.all(50),
        child: FormBuilder(
          key: _formKey,
          child: Column(
            children: [
              FormBuilderTextField(name: "Username"),
              FormBuilderTextField(name: "Password"),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      _formKey.currentState!.save();
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => PushData(
                                  formKey: _formKey, records: records)));
                    },
                    child: Text("Submit"),
                  ),
                  SizedBox(width: 50),
                  ElevatedButton(
                    onPressed: () {
                      _formKey.currentState!
                          .patchValue({"Username": "", "Password": ""});
                    },
                    child: Text("Clear"),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
