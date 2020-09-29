import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'homescreen_event.dart';
part 'homescreen_state.dart';

class HomescreenBloc extends Bloc<HomescreenEvent, HomescreenState> {
  HomescreenBloc(HomescreenState initialState) : super(initialState);

  @override
  HomescreenState get initialState => HomescreenInitial();
  @override
  Stream<HomescreenState> mapEventToState(
    HomescreenEvent event,
  ) async* {
    // TODO: implement mapEventToState
  }
}
