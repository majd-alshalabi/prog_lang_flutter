import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:prog_languages_flutter/shared/cubit/cubit.dart';
import 'package:prog_languages_flutter/shared/cubit/cubitstate.dart';
import 'package:prog_languages_flutter/view/mainScreenView.dart';

import '../../shared/constant.dart';
import 'RegisterScreen.dart';

class SigninScreen extends StatelessWidget {
  static final id = 'consumerSigninScreen';
  final _formKey = GlobalKey<FormState>();

  final TextEditingController emailController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          systemNavigationBarColor: Colors.grey[100],
          systemNavigationBarIconBrightness: Brightness.dark,
          statusBarIconBrightness: Brightness.dark),
      child: BlocProvider<MyCubit>(
        create: (BuildContext context) => MyCubit(),
        child: BlocConsumer<MyCubit, CubitStates>(
          listener: (context, state) {},
          builder: (context, state) => Scaffold(
            body: Container(
              alignment: Alignment.center,
              height: MediaQuery.of(context).size.height,
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Hero(
                      child: HeaderIcon(),
                      tag: 'icon',
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          InputContainer(
                            onchange: (value) {},
                            controller: emailController,
                            valid: (String value) {
                              if (value.isEmpty)
                                return 'this field must not be empty';
                              else
                                return null;
                            },
                            keyboardType: TextInputType.emailAddress,
                            placeHolderText: 'email',
                            newWidth: 4 * MediaQuery.of(context).size.width / 5,
                            obscureTextValue: false,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          InputContainer(
                            onchange: (value) {},
                            controller: passwordController,
                            valid: (String value) {
                              if (value == '' || value.length <= 5)
                                return 'password must be more than 5 Letters';
                              else
                                return null;
                            },
                            obscureTextValue: true,
                            placeHolderText: 'password',
                            newWidth: 4 * MediaQuery.of(context).size.width / 5,
                            keyboardType: TextInputType.text,
                          ),
                          Container(
                            child: Text(
                              MyCubit.get(context).errorText,
                              style: TextStyle(
                                color: Colors.red,
                              ),
                            ),
                            margin: EdgeInsets.only(top: 10),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(vertical: 16.0),
                            child: MyButton(
                              buttonColor: firstColor,
                              buttonFunction: () async {
                                if (_formKey.currentState!.validate()) {
                                  bool response = await MyCubit.get(context)
                                      .login(emailController.text,
                                          passwordController.text);
                                  if (response) {
                                    Navigator.pushAndRemoveUntil(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => MainScreen(
                                            email: emailController.text,
                                            name: MyCubit.get(context).usename,
                                            token: MyCubit.get(context).token,
                                          ),
                                        ),
                                        (route) => true);
                                  }
                                }
                              },
                              buttonText: 'Login',
                              width: 2 * MediaQuery.of(context).size.width / 5,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('new user ! '),
                        InkWell(
                          onTap: () {
                            Navigator.pushNamed(context, RegisterScreen.id);
                          },
                          child: Text(
                            'Register ?',
                            style: TextStyle(
                                decoration: TextDecoration.underline,
                                color: Colors.lightBlue),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
