import 'dart:convert';
import 'dart:io';

import 'package:animations/model/animationVO.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('parse animations in json file', () async {
    String text =
        await new File('assets/animationsCollection.json').readAsString();
    List decodedJson = jsonDecode(text)['animations']['animation'];

    decodedJson.forEach((element) {
      var animation = AnimationVO.fromJson(element);
      print('Howdy, ${animation.filename}!');
    });

    expect(AnimationVO.fromJson(decodedJson[0]).filename, "assets/SpaceX.flr");
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
}
