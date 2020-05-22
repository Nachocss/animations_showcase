import 'dart:ui';

import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';

abstract class ShowcaseEvent extends Equatable {
  const ShowcaseEvent();
}

class ListShowcase extends ShowcaseEvent {

  const ListShowcase();

  @override
  List<Object> get props => [];
}

class ShowAnimation extends ShowcaseEvent {
  final String filename;
  final String animationName;
  final Color backgroundColor;
  final String name;

  const ShowAnimation(
      {this.name, this.backgroundColor, this.filename, this.animationName});

  @override
  List<Object> get props => throw UnimplementedError();
}
