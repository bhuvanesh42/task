import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task/bloc/home/home_bloc.dart';
import 'package:task/Model/repositories.dart';
import 'package:task/Screen/homescreen.dart';

class FirstScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
          
       home: BlocProvider<EmployeeBloc>(
          create: (context) => EmployeeBloc(repository: Respositories()),
          child: HomePage(),
        ),
      
    );
  }
}
