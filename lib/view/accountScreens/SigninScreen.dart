import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../shared/constant.dart';
import 'RegisterScreen.dart';

class SigninScreen extends StatelessWidget {
  static final id = 'consumerSigninScreen';
  final _formKey = GlobalKey<FormState>();

  final TextEditingController emailController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    String errorText = '';
    bool isLoading = false;
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          systemNavigationBarColor: Colors.grey[100],
          systemNavigationBarIconBrightness: Brightness.dark,
          statusBarIconBrightness: Brightness.dark),
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
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
                            if (value == '' || value.isEmpty)
                              return 'this field must not be empty';
                            else
                              return null;
                          },
                          keyboardType: TextInputType.emailAddress,
                          placeHolderText: 'اسم المستخدم او الايميل',
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
                          placeHolderText: 'كلمة السر',
                          newWidth: 4 * MediaQuery.of(context).size.width / 5,
                          keyboardType: TextInputType.text,
                        ),
                        Container(
                          child: Text(
                            errorText,
                            style: TextStyle(
                              color: Colors.red,
                            ),
                          ),
                          margin: EdgeInsets.only(top: 10),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 16.0),
                          child: Material(
                            color: isLoading ? Colors.transparent : firstColor,
                            elevation: isLoading ? 0 : 5.0,
                            borderRadius:
                                BorderRadius.all(Radius.circular(30.0)),
                            child: MaterialButton(
                              minWidth:
                                  2 * MediaQuery.of(context).size.width / 5,
                              onPressed: () {},
                              height: 42.0,
                              child: isLoading
                                  ? CircularProgressIndicator()
                                  : Text(
                                      'تسجيل الدخول',
                                      style: TextStyle(color: Colors.white),
                                    ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('حساب جديد !'),
                      GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, RegisterScreen.id);
                        },
                        child: Text(
                          ' التسجيل ؟',
                          style: TextStyle(
                              decoration: TextDecoration.underline,
                              color: Colors.lightBlue),
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
