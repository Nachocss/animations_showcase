import 'package:animations/bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AnimationList extends StatelessWidget {
  const AnimationList({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print("Building animation list");
    return Container(
      child: ListView(
        shrinkWrap: true,
        padding: EdgeInsets.all(15.0),
        children: <Widget>[
          FlatButton(
            onPressed: () => BlocProvider.of<ShowcaseBloc>(context).add(
              ShowAnimation(
                  filename: "assets/SpaceX.flr",
                  animationName: "Full",
                  backgroundColor: Colors.black),
            ),
            child: Text("SpaceX"),
          ),
          FlatButton(onPressed: null, child: Text("None")),
          FlatButton(onPressed: null, child: Text("None")),
          FlatButton(onPressed: null, child: Text("None")),
          FlatButton(onPressed: null, child: Text("None")),
          FlatButton(onPressed: null, child: Text("None")),
          FlatButton(onPressed: null, child: Text("None")),
          FlatButton(onPressed: null, child: Text("None")),
          FlatButton(onPressed: null, child: Text("None")),
          FlatButton(onPressed: null, child: Text("None")),
          FlatButton(onPressed: null, child: Text("None")),
          FlatButton(onPressed: null, child: Text("None")),
          FlatButton(onPressed: null, child: Text("None")),
          FlatButton(onPressed: null, child: Text("None")),
        ],
      ),
    );
  }
}
