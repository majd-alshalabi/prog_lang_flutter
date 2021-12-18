import 'dart:convert';

import 'package:bloc/bloc.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'cubitstate.dart';

class MyCubit extends Cubit<CubitStates> {
  MyCubit() : super(InitialState());

  static MyCubit get(context) => BlocProvider.of(context);

  String errorText = '';
  String token = '';

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
}
