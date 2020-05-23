import 'dart:ui';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

abstract class ShowcaseState extends Equatable {
  const ShowcaseState();

  @override
  List<dynamic> get props => [];
}

class AppStarting extends ShowcaseState {
  const AppStarting();
}

class ShowcaseListing extends ShowcaseState {
  const ShowcaseListing();
}

class AnimationPlaying extends ShowcaseState {
  final String filename;
  final String animationName;
  final Color backgroundColor;
  final String name;

  const AnimationPlaying(
      {this.name, this.filename, this.animationName, this.backgroundColor});

  @override
  List<Object> get props => [filename, animationName, backgroundColor];
}
