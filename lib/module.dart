// ignore_for_file: prefer_const_constructors
// ignore_for_file: prefer_const_literals_to_create_immutables
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:weather/main.dart';

class Module extends StatefulWidget {
  const Module({super.key});

  @override
  State<Module> createState() => _ModuleState();
}

class _ModuleState extends State<Module> {
  List<DataRow> getData(BuildContext context, List<DocumentSnapshot> snapshot) {
    return snapshot.map((info) {
      Map record = info.data() as Map;
      record['DocumentId'] = info.id;
      return DataRow(
          onSelectChanged: (value) {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => Home(record: record)));
          },
          onLongPress: () {
            info.reference.delete();
          },
          cells: [
            DataCell(Text(record['Username'])),
            DataCell(Text(record['Password']))
          ]);
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Database"),
      ),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection('records').snapshots(),
        builder: ((context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasData) {
            return LinearProgressIndicator();
          }
          return DataTable(
              showCheckboxColumn: false,
              columns: [
                DataColumn(label: Text("Username")),
                DataColumn(label: Text("Password")),
              ],
              rows: getData(context, snapshot.data!.docs));
        }),
      ),
    );
  }
}
