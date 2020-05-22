import 'package:animations/bloc/bloc.dart';
import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SimpleAnimationViewer extends StatelessWidget {
  final Color backgroundColor;
  final String filename;
  final String animation;

  const SimpleAnimationViewer(
      {Key key, this.backgroundColor, this.filename, this.animation})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    print("Building animation viewer");
    return Scaffold(
      backgroundColor: backgroundColor ?? Colors.white,
      body: FlareActor(
        filename,
        alignment: Alignment.center,
        fit: BoxFit.contain,
        animation: animation,
      ),
    );
  }
}
