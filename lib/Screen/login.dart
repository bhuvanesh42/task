import 'package:flutter/material.dart';

import 'package:task/Screen/firstScreen.dart';
import 'package:task/bloc/bloc.dart';
import 'package:task/bloc/provider.dart';

class Login extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final bloc = Provider.of(context);
    return  Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(bottom: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Stack(
                  children: [
                    ClipPath(
                      clipper: MyClipper(),
                      child: Container(
                        height: 350,
                        width: double.infinity,
                        color: Colors.redAccent,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 5),
                      child: Container(
                        margin: EdgeInsets.only(top: 230),
                        height: 200,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Color(0XFFEFF3F6),
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                                color: Color.fromRGBO(0, 0, 0, 0.1),
                                offset: Offset(6, 2),
                                blurRadius: 6.0,
                                spreadRadius: 3.0),
                            BoxShadow(
                                color: Color.fromRGBO(0, 0, 0, 0.1),
                                offset: Offset(-6, -2),
                                blurRadius: 6.0,
                                spreadRadius: 3.0),
                          ],
                        ),
                        child: Padding(
                          padding: EdgeInsets.all(20),
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              shape: BoxShape.circle,
                              boxShadow: [
                                BoxShadow(
                                    color: Color.fromRGBO(0, 0, 0, 0.1),
                                    offset: Offset(6, 2),
                                    blurRadius: 6.0,
                                    spreadRadius: 3.0),
                                BoxShadow(
                                    color: Color.fromRGBO(0, 0, 0, 0.1),
                                    offset: Offset(-6, -2),
                                    blurRadius: 6.0,
                                    spreadRadius: 3.0),
                              ],
                            ),
                            child: Image.asset(
                              'assets/images/logo.png',
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 30,
                ),
                Container(
                  margin: EdgeInsets.only(left: 70),
                  child: Text(
                    'Email',
                    style: TextStyle(fontFamily: 'Bree', fontSize: 17),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Center(
                  child: Container(
                        margin: EdgeInsets.symmetric(horizontal: 10),
                        width: 300,
                        child: emailField(bloc)),
                ),
                
                SizedBox(
                  height: 30,
                ),
                Container(
                  margin: EdgeInsets.only(left: 70),
                  child: Text(
                    'Password',
                    style: TextStyle(fontFamily: 'Bree', fontSize: 17),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Center(
                  child: Container(
                    width: 300,
                        margin: EdgeInsets.symmetric(horizontal: 10),
                        child: passwordField(bloc)),
                ),
                
                SizedBox(
                  height: 50,
                ),
                Center(
                  child: Container(
                      width: 150,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        color: Colors.redAccent,
                        boxShadow: [
                          BoxShadow(
                              color: Colors.redAccent,
                              offset: Offset(6, 2),
                              blurRadius: 1.0,
                              spreadRadius: 2.0),
                          BoxShadow(
                              color: Colors.redAccent,
                              offset: Offset(-6, 2),
                              blurRadius: 1.0,
                              spreadRadius: 2.0),
                        ],
                      ),
                      child: submitButton(bloc)),
                ),
              ],
            ),
          ),
        ),
  
    );
  }
}

class MyClipper extends CustomClipper<Path> {
  @override
  getClip(Size size) {
    var path = new Path();
    path.lineTo(0, size.height);
    var firstcontrollpoint = Offset(size.width / 4, size.height - 65);
    var firstendpoint = Offset(size.width / 2, size.height);
    path.quadraticBezierTo(firstcontrollpoint.dx, firstcontrollpoint.dy,
        firstendpoint.dx, firstendpoint.dy);

    var secoundcontrollpoint =
        Offset(size.width - (size.width / 5), size.height + 20);
    var secoundendpoint = Offset(size.width, size.height - 80);
    path.quadraticBezierTo(secoundcontrollpoint.dx, secoundcontrollpoint.dy,
        secoundendpoint.dx, secoundendpoint.dy);

    path.lineTo(size.width, size.height);
    path.lineTo(size.width, 0);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper oldClipper) => false;
}

Widget emailField(Bloc bloc) {
  return StreamBuilder(
      stream: bloc.email,
      builder: (context, snapshot) {
        return TextField(
          onChanged: bloc.changeEmail,
          keyboardType: TextInputType.emailAddress,
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            hintText: 'you@example.com',
            labelText: 'Email Address',
            errorText: snapshot.error,
          ),
        );
      });
}

Widget passwordField(Bloc bloc) {
  return StreamBuilder(
      stream: bloc.password,
      builder: (context, snapshot) {
        return TextField(
          onChanged: bloc.changePassword,
          obscureText: true,
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            hintText: 'Password',
            labelText: 'Password',
            errorText: snapshot.error,
          ),
        );
      });
}

Widget submitButton(Bloc bloc) {
  return StreamBuilder(
    stream: bloc.submitValid,
    builder: (context, snapshot) {
      return FlatButton.icon(
          label: Text(
            'Sign In',
            style: TextStyle(
                fontFamily: 'Bree',
                color: Colors.white,
                fontSize: 15,
                fontWeight: FontWeight.bold),
          ),
          icon: Icon(
            Icons.label_important,
            color: Colors.white,
          ),
          onPressed: snapshot.hasData ? ()=> submit(context) : null);
    },
  );
}

submit(BuildContext context) {
  Navigator.push(context, MaterialPageRoute(builder: (context) => FirstScreen()));
}
