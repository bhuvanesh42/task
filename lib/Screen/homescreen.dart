import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task/Model/model.dart';
import 'package:task/bloc/home/home_bloc.dart';
import 'package:task/bloc/home/home_event.dart';
import 'package:task/bloc/home/home_state.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  EmployeeBloc articleBloc;

  @override
  void initState() {
    super.initState();
    articleBloc = BlocProvider.of<EmployeeBloc>(context);
    articleBloc.add(FetchArticlesEvent());
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Builder(
        builder: (context) {
          return Material(
            child: Scaffold(
              appBar: AppBar(
                title: Text("Employee Data"),
                actions: <Widget>[
                  IconButton(
                    icon: Icon(Icons.refresh),
                    onPressed: () {
                      articleBloc.add(FetchArticlesEvent());
                    },
                  ),
                ],
              ),
              body: Container(
                child: BlocListener<EmployeeBloc, ArticleState>(
                  listener: (context, state) {
                    if (state is ArticleErrorState) {
                      Scaffold.of(context).showSnackBar(
                        SnackBar(
                          content: Text(state.message),
                        ),
                      );
                    }
                  },
                  child: BlocBuilder<EmployeeBloc, ArticleState>(
                    builder: (context, state) {
                      if (state is ArticleInitialState) {
                        return buildLoading();
                      } else if (state is ArticleLoadingState) {
                        return buildLoading();
                      } else if (state is ArticleLoadedState) {
                        return buildArticleList(state.articles);
                      } else if (state is ArticleErrorState) {
                        return buildErrorUi(state.message);
                      }
                    },
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget buildLoading() {
    return Center(
      child: CircularProgressIndicator(),
    );
  }

  Widget buildErrorUi(String message) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          message,
          style: TextStyle(color: Colors.red),
        ),
      ),
    );
  }

  Widget buildArticleList(List<EmployeeData> emp) {
    return ListView.builder(
      itemCount: emp.length,
      itemBuilder: (ctx, pos) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child:Container(
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
                        child: Image.asset(
                            'assets/images/logo.png ${emp[pos].image}'),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        ' ${emp[pos].id}',
                        style: TextStyle(fontFamily: 'Bree', fontSize: 17),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        'Employee Name : ${emp[pos].name},',
                        style: TextStyle(fontFamily: 'Bree', fontSize: 17),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        'Employee Salary : ${emp[pos].salary}',
                        style: TextStyle(fontFamily: 'Bree', fontSize: 17),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        'Employee Age : ${emp[pos].age}',
                        style: TextStyle(fontFamily: 'Bree', fontSize: 17),
                      )
                    ],
                  ),
                ),
              ),
            ),
          )
        );
      },
    );
  }
}
