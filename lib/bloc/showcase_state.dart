import 'dart:ui';

import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

abstract class ShowcaseState extends Equatable {
  const ShowcaseState();

  @override
  List<dynamic> get props => [];
}

class ShowcaseListing extends ShowcaseState {
  const ShowcaseListing();
}

class AnimationPlaying extends ShowcaseState {
  final String filename;
  final String animationName;
  final Color backgroundColor;

  const AnimationPlaying({this.filename, this.animationName, this.backgroundColor});

  @override
  List<Object> get props => [filename, animationName, backgroundColor];
}