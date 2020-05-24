import 'dart:io';

import 'package:animations/bloc/bloc.dart';
import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          GestureDetector(
            onDoubleTap: () =>
                BlocProvider.of<ShowcaseBloc>(context).add(ListShowcase()),
            child: Container(
              decoration: BoxDecoration(color: Colors.redAccent),
              child: FlareActor(
                "assets" + Platform.pathSeparator + "SplashScreen.flr",
                alignment: Alignment.center,
                fit: BoxFit.contain,
                animation: "LongVersion",
                callback: (String animationName) {
                  BlocProvider.of<ShowcaseBloc>(context).add(ListShowcase());
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
