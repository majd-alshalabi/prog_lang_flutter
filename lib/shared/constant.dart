import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

final Color firstColor = Color(0XFFffbf59);
final Color secondColor = Color(0XFFffb8d3);
final Color thirdColor = Color(0XFF587067);

final firstFont = 'Quicksand-VariableFont_wght';
final secondFont = 'OpenSansCondensed-Light';
final thirdFont = 'Lateef-Regular';

Widget getTextWidgets(List<String> strings, TextStyle textStyle) {
  List<Widget> list = [];
  for (var i = 0; i < strings.length; i++) {
    list.add(Text(
      i != strings.length - 1 ? '${strings[i]} , ' : strings[i],
      style: textStyle,
    ));
  }
  return Row(children: list);
}

class MyButton extends StatelessWidget {
  final String buttonText;
  final Color buttonColor;
  final Function buttonFunction;
  final double width;

  MyButton(
      {required this.buttonText,
      required this.buttonColor,
      required this.buttonFunction,
      required this.width});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      child: Material(
        color: buttonColor,
        borderRadius: BorderRadius.all(Radius.circular(30.0)),
        elevation: 5.0,
        child: MaterialButton(
          onPressed: () {
            buttonFunction();
          },
          height: 42.0,
          minWidth: width,
          child: Text(
            buttonText,
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}

class ShadowText extends StatelessWidget {
  ShadowText(this.data, {required this.style});

  final String data;
  final TextStyle style;

  Widget build(BuildContext context) {
    return new ClipRect(
      child: new Stack(
        children: [
          new Positioned(
            top: 2.0,
            left: 2.0,
            child: new Text(data, style: TextStyle()),
          ),
          new BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 2.0, sigmaY: 2.0),
            child: new Text(data, style: style),
          ),
        ],
      ),
    );
  }
}

class SearchSection extends StatefulWidget {
  final Function onclick;
  final TextEditingController myController;

  SearchSection({required this.onclick, required this.myController});

  @override
  _SearchSectionState createState() => _SearchSectionState();
}

class _SearchSectionState extends State<SearchSection> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            icon: Icon(
              Icons.search,
              color: firstColor,
            ),
            onPressed: () {
              widget.onclick();
            },
          ),
          Expanded(
            child: TextField(
              textAlign: TextAlign.right,
              onSubmitted: (value) {
                widget.onclick();
              },
              controller: widget.myController,
              cursorColor: Colors.black,
              decoration: InputDecoration(
                border: InputBorder.none,
                focusedBorder: InputBorder.none,
                enabledBorder: InputBorder.none,
                errorBorder: InputBorder.none,
                disabledBorder: InputBorder.none,
                hintText: "البحث عن مطعم",
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class HeaderIcon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      width: size.width,
      height: size.height * 0.3,
      child: Column(
        children: [
          Image(
            width: MediaQuery.of(context).size.width / 3,
            image: AssetImage('assets/images/rat.png'),
          ),
          RichText(
            textAlign: TextAlign.center,
            text: new TextSpan(
              style: new TextStyle(
                fontSize: 40.0,
                color: thirdColor,
              ),
              children: <TextSpan>[
                TextSpan(
                    text: 'Rat', style: TextStyle(fontWeight: FontWeight.w600)),
                TextSpan(
                    text: 'order',
                    style: TextStyle(
                        color: firstColor,
                        fontWeight: FontWeight.w600,
                        fontFamily: firstFont)),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class InputContainer extends StatelessWidget {
  final String placeHolderText;
  final double newWidth;
  final TextEditingController controller;
  final bool obscureTextValue;
  final TextInputType keyboardType;
  final Function valid;
  final Function onchange;

  InputContainer(
      {required this.placeHolderText,
      required this.newWidth,
      required this.controller,
      required this.obscureTextValue,
      required this.keyboardType,
      required this.valid,
      required this.onchange});
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: MediaQuery.of(context).size.height * 0.09,
      width: newWidth,
      margin: EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: Colors.white,
      ),
      child: TextFormField(
        onChanged: (val) {
          onchange(val);
        },
        textInputAction: TextInputAction.next,
        validator: (val) {
          return valid(val);
        },
        obscureText: obscureTextValue,
        keyboardType: keyboardType,
        controller: controller,
        cursorColor: Colors.black,
        decoration: InputDecoration(
          border: InputBorder.none,
          focusedBorder: InputBorder.none,
          enabledBorder: InputBorder.none,
          errorBorder: InputBorder.none,
          disabledBorder: InputBorder.none,
          contentPadding:
              EdgeInsets.only(left: 15, bottom: 11, top: 11, right: 15),
          hintText: placeHolderText,
        ),
      ),
    );
  }
}

class JustClickSearchSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Container(
        margin: EdgeInsets.all(10),
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        decoration: BoxDecoration(
          color: Colors.grey[200],
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'البحث عن مطعم ...',
              style: TextStyle(color: Colors.grey),
            ),
            Icon(
              Icons.search,
              color: firstColor,
            )
          ],
        ),
      ),
    );
  }
}
