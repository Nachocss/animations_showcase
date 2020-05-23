import 'dart:convert';
import 'dart:io';

import 'package:animations/model/animationVO.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:flutter/services.dart' show rootBundle;

void main() {
  test('parse animations in json file', () async {
    String text =
        await new File('assets/animationsCollection.json').readAsString();
    List decodedJson = jsonDecode(text)['animations']['animation'];

    decodedJson.forEach((element) {
      var animation = AnimationVO.fromJson(element);
      print('Howdy, ${animation.filename}!');
    });

    expect(AnimationVO.fromJson(decodedJson[0]).filename, "SpaceX.flr");
  });

  test('create widgets', () async {
    String text =
        await new File('assets/animationsCollection.json').readAsString();
    List decodedJson = jsonDecode(text)['animations']['animation'];

    var animationList = <Widget>[];
    decodedJson.forEach((element) {
      var animationVO = AnimationVO.fromJson(element);
      animationList.add(FlatButton(
        onPressed: () {},
        child: Text(animationVO.name),
      ));
    });
  });

  test('check if file exists', () async {
    expect(
        await File("assets" + Platform.pathSeparator + "SpaceX.flr").exists(),
        true);
    expect(
        await File("assets" + Platform.pathSeparator + "LoadingIcon.flr")
            .exists(),
        false);
    expect(File("assets" + Platform.pathSeparator + "SpaceX.flr").existsSync(),
        true);
    expect(
        File("assets" + Platform.pathSeparator + "LoadingIcon.flr")
            .existsSync(),
        false);

    var returnValue = false;
    try {
      await rootBundle.load("assets" + Platform.pathSeparator + "ASd.flr");
    } catch (FlutterError) {
      print("Catch");
      returnValue = true;
    }

    expect(returnValue, true);
  });
}
