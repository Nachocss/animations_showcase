import 'package:flutter/material.dart';

class Animation {
  final String filename;
  final String animationName;
  final Colors backgroundColor;

  Animation(this.filename, this.animationName, this.backgroundColor);

  Animation.fromJson(Map<String, dynamic> json)
      : filename = json['filename'],
        animationName = json['animation'],
        backgroundColor = json['background'];
}
