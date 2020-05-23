import 'package:animations/widgets/animation_list_element.dart';
import 'package:flutter/material.dart';

class AnimationList extends StatelessWidget {

  AnimationList({Key key,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Widget>>(
      future: AnimationListElement.getAnimationsFromJson(context),
      builder: (context, AsyncSnapshot<List<Widget>> snapshot) {
        if (snapshot.hasData) {
          return Container(
            child: ListView(
              shrinkWrap: true,
              padding: EdgeInsets.all(15.0),
              children: snapshot.data,
            ),
          );
        } else {
          return Container(
            child: ListView(
              shrinkWrap: true,
              padding: EdgeInsets.all(15.0),
              children: <Widget>[
                Text("Empty"),
              ],
            ),
          );
        }
      },
    );
  }
}
