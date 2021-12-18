import 'dart:convert';

import 'package:bloc/bloc.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:prog_languages_flutter/shared/sharedPre.dart';
import 'cubitstate.dart';

class MyCubit extends Cubit<CubitStates> {
  MyCubit() : super(InitialState());

  static MyCubit get(context) => BlocProvider.of(context);

  String errorText = '';
  String token = '';
  String usename = '';
  String userEmail = '';

  bool initLoadingBool = false;

  Future<bool> login(String email, String password) async {
    errorText = '';
    emit(LoadingState());
    try {
      var url = Uri.parse('http://10.0.2.2:8000/api/login');
      var response =
          await http.post(url, body: {"email": email, "password": password});
      if (response.body.contains('token')) {
        var decodedRespon = jsonDecode(response.body);
        token = decodedRespon['token'];
        String name = decodedRespon['name'];
        await SharedPre.setEmail(email);
        await SharedPre.setUsername(name);
        await SharedPre.setToken(token);
        usename = name;
        userEmail = email;

        emit(LoadedState());
        return true;
      } else {
        errorText = 'no such account';
        emit(NoSuchAccount());
        return false;
      }
    } catch (e) {
      errorText = 'Cant Reach database';
      emit(FailureState());
      return false;
    }
  }

  Future<bool> register(String name, String email, String password) async {
    errorText = '';
    emit(LoadingState());
    try {
      var url = Uri.parse('http://10.0.2.2:8000/api/register');
      var response = await http.post(url, body: {
        "name": name,
        "email": email,
        "password": password,
        "password_confirmation": password
      });
      if (response.statusCode == 201) {
        var decodedRespon = jsonDecode(response.body);
        token = decodedRespon['token'];
        await SharedPre.setEmail(email);
        await SharedPre.setUsername(name);
        await SharedPre.setToken(token);
        usename = name;
        userEmail = email;
        emit(LoadedState());
        return true;
      } else {
        errorText = 'this email is alrady in use';
        emit(AlreadyInUseState());
        return false;
      }
    } catch (e) {
      errorText = 'Cant Reach database';
      emit(FailureState());
      return false;
    }
  }

  void init(String name, String email, String token2) {
    token = token2;
    usename = name;
    userEmail = email;
  }
}
