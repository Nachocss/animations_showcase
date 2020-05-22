import 'dart:ui';

import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';

abstract class ShowcaseEvent extends Equatable {
  const ShowcaseEvent();
}

class ListShowcase extends ShowcaseEvent {
  final List<Widget> buttons;

  ListShowcase(this.buttons);

  @override
  List<Object> get props => [buttons];
}

class ShowAnimation extends ShowcaseEvent {
  final String filename;
  final String animationName;
  final Color backgroundColor;

  const ShowAnimation(
      {this.backgroundColor, this.filename, this.animationName});

  @override
  List<Object> get props => throw UnimplementedError();
}
