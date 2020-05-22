import 'package:flutter/material.dart';

class AnimationVO {
  final String filename;
  final String animationName;
  final String backgroundColor;
  final String name;

  AnimationVO(this.filename, this.animationName, this.backgroundColor, this.name);

  AnimationVO.fromJson(Map<String, dynamic> json)
      : filename = json['filename'],
        animationName = json['animation'],
        backgroundColor = json['background'],
        name = json['name'];
}
