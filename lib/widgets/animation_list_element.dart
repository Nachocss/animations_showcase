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

      animationList.add(
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(
              color: Colors.red,
            ),
            borderRadius: BorderRadius.all(
              Radius.circular(15),
            ),
          ),
          margin: EdgeInsets.all(5),
          child: ListTile(
            leading: Icon(
              Icons.donut_large,
              color: Colors.redAccent,
            ),
            title: Text(
              animationVO.name,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            onTap: () => BlocProvider.of<ShowcaseBloc>(context).add(
              ShowAnimation(
                filename: animationVO.filename,
                animationName: animationVO.animationName,
                backgroundColor: _parseColor(animationVO.backgroundColor),
                name: animationVO.name,
              ),
            ),
          ),
        ),
      );
    });
    return animationList;
  }

  static Color _parseColor(String color) {
    switch (color.toUpperCase()) {
      case "BLACK":
        return Colors.black;
      case "WHITE":
        return Colors.white;
      case "REDACCENT":
        return Colors.redAccent;
    }
    // return Color.fromARGB(100, 20,20,20);
    if (color.startsWith(RegExp("ARGB"))) {
      List rgbValues = color.split(",");
      return Color.fromARGB(int.parse(rgbValues[1]), int.parse(rgbValues[2]),
          int.parse(rgbValues[3]), int.parse(rgbValues[4]));
    }

    return Colors.transparent;
  }
}
