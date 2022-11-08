import 'dart:html';

import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class PushData extends StatelessWidget {
  const PushData({super.key, required this.formKey, required this.records});

  final records;
  final formKey;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Upload")),
        body: Upload(
          formKey: formKey,
          records: records,
        ));
  }
}

class Upload extends StatefulWidget {
  const Upload({super.key, required this.formKey, required this.records});
  final GlobalKey<FormBuilderState> formKey;
  final records;

  @override
  State<Upload> createState() => _UploadState();
}

class _UploadState extends State<Upload> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: FloatingActionButton(
        onPressed: () {
          Map<String, dynamic> data = super
              .widget
              .formKey
              .currentState!
              .value
              .map((key, value) => MapEntry(key, value));
          super.widget.records.add(data);
          super
              .widget
              .formKey
              .currentState!
              .patchValue({"Username": "", "Password": ""});
        },
        child: Icon(Icons.upload),
      ),
    );
  }
}
