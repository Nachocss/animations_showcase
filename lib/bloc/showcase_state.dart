import 'dart:ui';

import 'package:animations/model/animationDAO.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

abstract class ShowcaseState extends Equatable {
  const ShowcaseState();

  @override
  List<dynamic> get props => [];
}

class ShowcaseListing extends ShowcaseState {
  final List<Widget> buttons = null; //AnimationDAO.getAnimationsFromJson() as List<Widget>;

  @override
  List<dynamic> get props => [buttons];
}

class AnimationPlaying extends ShowcaseState {
  final String filename;
  final String animationName;
  final Color backgroundColor;
  final String name;

  const AnimationPlaying({this.name, this.filename, this.animationName, this.backgroundColor});

  @override
  List<Object> get props => [filename, animationName, backgroundColor];
}