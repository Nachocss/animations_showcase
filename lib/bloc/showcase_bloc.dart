import 'dart:io';

import 'package:animations/bloc/showcase_event.dart';
import 'package:animations/bloc/showcase_state.dart';
import 'package:animations/widgets/splash_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:bloc/bloc.dart';

import 'package:animations/bloc/bloc.dart';

class ShowcaseBloc extends Bloc<ShowcaseEvent, ShowcaseState> {

  @override
  ShowcaseState get initialState => AppStarting();

  @override
  Stream<ShowcaseState> mapEventToState(
    ShowcaseEvent event,
  ) async* {
    if(event is AppStarting) {
      yield AppStarting();
    }
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