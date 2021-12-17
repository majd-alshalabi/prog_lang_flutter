import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../shared/constant.dart';

class RegisterScreen extends StatelessWidget {
  static final id = 'consumerRegisterScreen';

  final TextEditingController nameController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();

  final TextEditingController confirmController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

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
          body: Center(
            child: ListView(
              shrinkWrap: true,
              children: [
                Column(
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
                            valid: (value) {
                              if (value == '' || value.isEmpty) {
                                return 'Please enter some text';
                              } else
                                return null;
                            },
                            keyboardType: TextInputType.emailAddress,
                            controller: nameController,
                            placeHolderText: 'اسم المستخدم او الايميل',
                            newWidth: 4 * MediaQuery.of(context).size.width / 5,
                            obscureTextValue: false,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          InputContainer(
                            onchange: (value) {},
                            valid: (String value) {
                              if (value.length <= 5)
                                return 'password must be more than 5 Letter';
                              else
                                return null;
                            },
                            obscureTextValue: true,
                            controller: passwordController,
                            placeHolderText: 'كلمة السر',
                            newWidth: 4 * MediaQuery.of(context).size.width / 5,
                            keyboardType: TextInputType.text,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          InputContainer(
                            onchange: (value) {},
                            valid: (value) {
                              if (value != passwordController.text)
                                return 'both password must be equal';
                              else
                                return null;
                            },
                            obscureTextValue: true,
                            controller: confirmController,
                            placeHolderText: 'تأكيد كلمة السر',
                            newWidth: 4 * MediaQuery.of(context).size.width / 5,
                            keyboardType: TextInputType.text,
                          ),
                          Container(
                            padding: EdgeInsets.only(top: 10),
                            child: Text(
                              errorText,
                              style: TextStyle(color: Colors.red),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(vertical: 16.0),
                            child: Material(
                              color:
                                  isLoading ? Colors.transparent : firstColor,
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
                                        'التسجيل',
                                        style: TextStyle(
                                          color: Colors.white,
                                        ),
                                      ),
                              ),
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
