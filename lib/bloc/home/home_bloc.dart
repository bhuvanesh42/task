import 'dart:async';

import 'package:bloc/bloc.dart';

import 'package:flutter/foundation.dart';
import 'package:task/Model/model.dart';
import 'package:task/Model/repositories.dart';

import 'home_event.dart';
import 'home_state.dart';

class EmployeeBloc extends Bloc<ArticleEvent, ArticleState> {

  EmployeeRepository repository;

  EmployeeBloc({@required this.repository});

  @override
  
  ArticleState get initialState => ArticleInitialState();

  @override
  Stream<ArticleState> mapEventToState(ArticleEvent event) async* {
    if (event is FetchArticlesEvent) {
      yield ArticleLoadingState();
      try {
        List<EmployeeData> articles = await repository.getEmployeData();
        yield ArticleLoadedState(articles: articles);
      } catch (e) {
        yield ArticleErrorState(message: e.toString());
      }
    }
  }

}