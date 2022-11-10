// ignore_for_file: prefer_const_constructors
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:page_transition/page_transition.dart';
import 'package:weather/module.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: AnimatedSplashScreen(
        splash: Icons.g_mobiledata,
        nextScreen: Home(),
        splashTransition: SplashTransition.fadeTransition,
        pageTransitionType: PageTransitionType.fade,
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
        backgroundColor: Colors.black,
        bottomOpacity: 0,
      ),
      body: FormContainer(),
    );
    ;
  }
}

class FormContainer extends StatefulWidget {
  const FormContainer({super.key});

  @override
  State<FormContainer> createState() => _FormContainerState();
}

class _FormContainerState extends State<FormContainer> {
  final _formKey = GlobalKey<FormBuilderState>();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(50),
      child: FormBuilder(
        key: _formKey,
        child: Column(
          children: [
            FormBuilderTextField(
              validator: FormBuilderValidators.compose(
                [
                  FormBuilderValidators.required(
                    errorText: "Please Enter Username",
                  )
                ],
              ),
              name: "Username",
              decoration: InputDecoration(
                icon: Icon(Icons.account_circle),
                labelText: "Username",
              ),
            ),
            SizedBox(height: 20),
            FormBuilderTextField(
              validator: FormBuilderValidators.compose(
                [
                  FormBuilderValidators.required(
                    errorText: "Please Enter Password",
                  )
                ],
              ),
              name: "Password",
              decoration: InputDecoration(
                  icon: Icon(Icons.password), labelText: "Password"),
            ),
            SizedBox(height: 50),
            ElevatedButton(
              onPressed: () {
                _formKey.currentState!.save();
                Navigator.push(
                  context,
                  PageTransition(
                    duration: Duration(milliseconds: 500),
                    alignment: Alignment.center,
                    child: Module(formKey: _formKey),
                    type: PageTransitionType.rightToLeft,
                  ),
                );
              },
              style: ButtonStyle(
                  backgroundColor:
                      MaterialStateColor.resolveWith((states) => Colors.black)),
              child: Text("Login"),
            )
          ],
        ),
      ),
    );
  }
}
