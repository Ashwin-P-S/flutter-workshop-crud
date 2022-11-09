// ignore_for_file: prefer_const_constructors, avoid_print
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:weather/module.dart';
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
  final record;
  Home({super.key, this.record});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final _formKey = GlobalKey<FormBuilderState>();
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      funCall();
    });
  }

  void funCall() {
    if (widget.record == null || widget.record == '') return;
    Map record = widget.record as Map;
    record.forEach((key, value) {
      _formKey.currentState!.patchValue({'$key': '$value'});
    });
  }

  CollectionReference records =
      FirebaseFirestore.instance.collection('records');

  @override
  Widget build(BuildContext context) {
    print(widget.record.hashCode);

    return Scaffold(
      drawer: Drawer(
        child: Column(
          children: [
            ListTile(
              title: Text(
                "Login",
                style: TextStyle(color: Colors.blue),
              ),
              hoverColor: Colors.blue.shade100,
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text(
                "Database",
                style: TextStyle(color: Colors.blue),
              ),
              hoverColor: Colors.blue.shade100,
              onTap: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => Module()));
              },
            )
          ],
        ),
      ),
      appBar: AppBar(title: Text("Home")),
      body: Padding(
        padding: EdgeInsets.all(100),
        child: FormBuilder(
          key: _formKey,
          child: Column(
            children: [
              FormBuilderTextField(
                name: "Username",
                decoration: InputDecoration(labelText: "Username"),
                style: TextStyle(color: Colors.blue),
              ),
              SizedBox(height: 10),
              FormBuilderTextField(
                name: "Password",
                decoration: InputDecoration(labelText: "Password"),
              ),
              SizedBox(height: 10),
              Visibility(
                visible: true,
                maintainState: true,
                child: FormBuilderTextField(
                  name: "DocumentId",
                  decoration: InputDecoration(labelText: "Doucment Id"),
                ),
              ),
              SizedBox(height: 100),
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
