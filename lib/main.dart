import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:prog_languages_flutter/shared/sharedPre.dart';
import 'package:prog_languages_flutter/view/mainScreenView.dart';
import 'view/accountScreens/SigninScreen.dart';
import 'view/accountScreens/RegisterScreen.dart';
import 'shared/cubit/cubit.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    initFunc();
  }

  String username = '';
  String email = '';
  String token = '';
  bool initLoadingBool = false;
  bool initScreen = false;
  void initFunc() async {
    token = await SharedPre.getToken();
    if (token == '') {
      initScreen = false;
    } else {
      email = await SharedPre.getEmail();
      username = await SharedPre.getUsername();
      initScreen = true;
    }
    initLoadingBool = true;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => MyCubit(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          SigninScreen.id: (BuildContext context) => SigninScreen(),
          RegisterScreen.id: (BuildContext context) => RegisterScreen(),
        },
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: !initLoadingBool
            ? Scaffold(
                body: CircularProgressIndicator(),
              )
            : initScreen
                ? MainScreen(
                    token: token,
                    email: email,
                    name: username,
                  )
                : SigninScreen(),
      ),
    );
  }
}
