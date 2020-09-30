import 'package:flutter/material.dart';
import 'package:task/Screen/login.dart';
import 'package:task/bloc/login/provider.dart';
class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Provider(
          child: Scaffold(
        body: Login() ,
        
      ),
    );
  }
}