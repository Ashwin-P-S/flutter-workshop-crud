import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

void main() => runApp(MyApp());

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
  var genderOptions = ['M', 'F'];
  Color myColor = Colors.white;
  Color fontColor = Colors.black;
  final _formKey = GlobalKey<FormBuilderState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Home")),
      backgroundColor: myColor,
      body: Padding(
        padding: EdgeInsets.all(50),
        child: FormBuilder(
          key: _formKey,
          child: Column(
            children: [
              FormBuilderDateRangePicker(
                name: 'dateRange',
                firstDate: DateTime(2000),
                lastDate: DateTime(2024),
                decoration: InputDecoration(
                  labelText: 'Click to Select Date',
                  labelStyle: TextStyle(color: fontColor),
                  hintText: 'Hint text',
                ),
              ),
              FormBuilderDropdown<String>(
                // autovalidate: true,
                name: 'gender',
                decoration: InputDecoration(
                  labelText: 'Gender',
                  hintText: 'Select Gender',
                  labelStyle: TextStyle(color: fontColor),
                ),
                items: genderOptions
                    .map((gender) => DropdownMenuItem(
                          alignment: AlignmentDirectional.center,
                          value: gender,
                          child: Text(
                            gender,
                            style: TextStyle(color: fontColor),
                          ),
                        ))
                    .toList(),
                valueTransformer: (val) => val?.toString(),
              ),
              FormBuilderSegmentedControl(
                decoration: InputDecoration(
                  labelText: 'Movie Rating (Archer)',
                  labelStyle: TextStyle(color: fontColor),
                ),
                name: 'movie_rating',
                initialValue: 1,
                // textStyle: TextStyle(fontWeight: FontWeight.bold),
                options: List.generate(5, (i) => i + 1)
                    .map((number) => FormBuilderFieldOption(
                          value: number,
                          child: Text(
                            number.toString(),
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ))
                    .toList(),
              ),
              FormBuilderSwitch(
                title: Text(
                  'Dark Mode',
                  style: TextStyle(color: fontColor),
                ),
                name: 'dark_mode',
                onChanged: (value) {
                  setState(() {
                    myColor = (value == true) ? Colors.black : Colors.white;
                    fontColor = (value == true) ? Colors.white : Colors.black;
                  });
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
