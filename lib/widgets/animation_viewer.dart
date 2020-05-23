import 'dart:io';

import 'package:animations/bloc/bloc.dart';
import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter/services.dart' show rootBundle;

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
    FlareActor flareActor = FlareActor(
      "assets" + Platform.pathSeparator + filename,
      alignment: Alignment.center,
      fit: BoxFit.contain,
      animation: animation,
    );
    return WillPopScope(
      child: Scaffold(
        backgroundColor: backgroundColor ?? Colors.white,
        body: flareActor,
      ),
      onWillPop: () {
        BlocProvider.of<ShowcaseBloc>(context).add(ListShowcase());
        return Future(() =>false);
      },
    );
  }
}
class ErrorDialog extends StatelessWidget {
  const ErrorDialog({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: CupertinoAlertDialog(
        title: Text('Error encontered'),
        content: (Text('The animation couldnt be loaded. Try it again')),
        actions: <Widget>[
          CupertinoDialogAction(
            child: Text("Accept"),
            onPressed: () =>
                BlocProvider.of<ShowcaseBloc>(context).add(ListShowcase()),
          ),
        ],
      ),
    );
  }
}
