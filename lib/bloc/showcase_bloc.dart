import 'dart:io';

import 'package:animations/bloc/showcase_event.dart';
import 'package:animations/bloc/showcase_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:bloc/bloc.dart';

import 'package:animations/bloc/bloc.dart';

class ShowcaseBloc extends Bloc<ShowcaseEvent, ShowcaseState> {

  @override
  ShowcaseState get initialState => ShowcaseListing();

  @override
  Stream<ShowcaseState> mapEventToState(
    ShowcaseEvent event,
  ) async* {
    if (event is ListShowcase) {
      yield ShowcaseListing();
    }
    if (event is ShowAnimation) {
      yield AnimationPlaying(
          filename: event.filename,
          animationName: event.animationName,
          backgroundColor: event.backgroundColor);
    }
  }
}