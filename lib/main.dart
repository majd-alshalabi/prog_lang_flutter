import 'package:flutter/material.dart';
import 'package:prog_languages_flutter/view/mainScreenView.dart';
import 'view/accountScreens/SigninScreen.dart';
import 'view/accountScreens/RegisterScreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        SigninScreen.id: (BuildContext context) => SigninScreen(),
        MainScreen.id: (BuildContext context) => MainScreen(),
        RegisterScreen.id: (BuildContext context) => RegisterScreen(),
      },
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SigninScreen(),
    );
  }
}
