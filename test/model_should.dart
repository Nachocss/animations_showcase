import 'dart:convert';

import 'package:animations/model/animation.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {

  test('handle \'Colors\' instance in json file', () {
    Map animationMap = jsonDecode("assets/animationsCollection.json");
    var animation = Animation.fromJson(animationMap);
    print('Howdy, ${animation.animationName}!');
  });
}