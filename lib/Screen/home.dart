import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          'User Details',
          style: TextStyle(fontFamily: 'Bree'),
        ),
      ),
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 50, vertical: 50),
        child: Card(
          elevation: 16,
          child: Container(
            color: Colors.white,
            height: 270,
            width: 300,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CircleAvatar(
                    radius: 50,
                    backgroundColor: Colors.white,
                    child: Image.asset('assets/images/logo.png'),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    'Employee ID : ',
                    style: TextStyle(fontFamily: 'Bree', fontSize: 17),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Employee Name : ',
                    style: TextStyle(fontFamily: 'Bree', fontSize: 17),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Employee Salary : ',
                    style: TextStyle(fontFamily: 'Bree', fontSize: 17),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Employee Age : ',
                    style: TextStyle(fontFamily: 'Bree', fontSize: 17),
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
