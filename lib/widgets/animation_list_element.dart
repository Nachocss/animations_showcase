import 'dart:convert';

import 'package:animations/bloc/bloc.dart';
import 'package:animations/model/animationVO.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


import 'package:flutter/services.dart' show rootBundle;

export 'dart:async' show Future;

class AnimationListElement {
  const AnimationListElement();

  static Future<List<Widget>> getAnimationsFromJson(
      BuildContext context) async {
    String text =
        await rootBundle.loadString("assets/animationsCollection.json");

    List jsonObjects = jsonDecode(text)['animations']['animation'];

    var animationList = <Widget>[];
    jsonObjects.forEach((object) {
      var animationVO = AnimationVO.fromJson(object);
      animationList.add(FlatButton(
        onPressed: () => BlocProvider.of<ShowcaseBloc>(context).add(
          ShowAnimation(
            filename: animationVO.filename,
            animationName: animationVO.animationName,
            backgroundColor: _parseColor(animationVO.backgroundColor),
            name: animationVO.name,
          ),
        ),
        child: Text(animationVO.name),
      ));
    });
    return animationList;
  }

  static Color _parseColor(String color) {
    switch (color.toUpperCase()) {
      case "BLACK": return Colors.black;
      case "WHITE": return Colors.white;
    }
    return Colors.transparent;
  }
}
