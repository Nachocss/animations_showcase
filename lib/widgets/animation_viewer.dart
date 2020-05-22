import 'dart:io';
import 'dart:io';

import 'package:animations/bloc/bloc.dart';
import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SimpleAnimationViewer extends StatelessWidget {
  final Color backgroundColor;
  final String name;
  final String filename;
  final String animation;

  const SimpleAnimationViewer(
      {Key key, this.backgroundColor, this.filename, this.animation, this.name})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      child: Scaffold(
        backgroundColor: backgroundColor ?? Colors.white,
        body: FlareActor(
          "assets" + Platform.pathSeparator + filename,
          alignment: Alignment.center,
          fit: BoxFit.contain,
          animation: animation,
        ),
      ),
      onWillPop: () {
        BlocProvider.of<ShowcaseBloc>(context).add(ListShowcase());
        return Future(() =>
            false); //Giving 'true' to this value will make our app to close.
      },
    );
  }
}
