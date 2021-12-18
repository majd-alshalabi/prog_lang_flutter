import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:prog_languages_flutter/shared/cubit/cubitstate.dart';
import 'package:prog_languages_flutter/shared/cubit/cubit.dart';

class MainScreen extends StatefulWidget {
  final String name, email, token;

  const MainScreen(
      {Key? key, required this.name, required this.email, required this.token})
      : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  void initState() {
    super.initState();
    context.read<MyCubit>().init(widget.name, widget.email, widget.token);
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MyCubit, CubitStates>(
      listener: (context, state) {},
      builder: (context, state) => Scaffold(
        body: Container(
          alignment: Alignment.center,
          child: Text(MyCubit.get(context).token),
        ),
      ),
    );
  }
}
