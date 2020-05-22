import 'package:animations/model/animationDAO.dart';
import 'package:flutter/material.dart';

class AnimationList extends StatelessWidget {
  List<Widget> buttons;
  AnimationList({Key key, this.buttons}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print("Building animation list");

    return FutureBuilder<List<Widget>>(
      future: AnimationDAO.getAnimationsFromJson(context),
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
              children: buttons ??
                  <Widget>[
                    Text("Empty"),
                  ],
            ),
          );
        }
      },
    );
/*
    return Container(
      child: ListView(
        shrinkWrap: true,
        padding: EdgeInsets.all(15.0),
        children: buttons ??
            <Widget>[
              Text("Empty"),
              FlatButton(
                onPressed: () => BlocProvider.of<ShowcaseBloc>(context).add(
                  ShowAnimation(
                      filename: "assets/SpaceX.flr",
                      animationName: "Full",
                      backgroundColor: Colors.black),
                ),
                child: Text("SpaceX"),
              ),
            ],
      ),
    );*/
  }
}
