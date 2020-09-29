import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'loging_event.dart';
part 'loging_state.dart';

class LogingBloc extends Bloc<LogingEvent, LogingState> {
  LogingBloc() : super(LogingInitial());

  @override
  Stream<LogingState> mapEventToState(
    LogingEvent event,
  ) async* {
    // TODO: implement mapEventToState
  }
}
