import 'dart:ui';

import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

abstract class ShowcaseEvent extends Equatable {
  const ShowcaseEvent();
}

class ListShowcase extends ShowcaseEvent {
  @override
  List<Object> get props => throw UnimplementedError();
}

class ShowAnimation extends ShowcaseEvent {
  final String filename;
  final String animationName;
  final Color backgroundColor;

  const ShowAnimation({this.backgroundColor, this.filename, this.animationName});

  @override
  List<Object> get props => throw UnimplementedError();
}
