import 'package:animations/widgets/animation_list_element.dart';
import 'package:flutter/material.dart';

class AnimationList extends StatefulWidget {
  AnimationList({
    Key key,
  }) : super(key: key);

  @override
  _AnimationListState createState() => _AnimationListState();
}

class _AnimationListState extends State<AnimationList> {
  GlobalKey<AnimatedListState> animatedListKey = GlobalKey<AnimatedListState>();

  @override
  Widget build(BuildContext context) {

    animateListAfterFetch(context);

    return FutureBuilder<List<Widget>>(
      future: AnimationListElement.getAnimationsFromJson(context),
      builder: (context, AsyncSnapshot<List<Widget>> snapshot) {

        return Scaffold(
          backgroundColor: Colors.redAccent,
          appBar: AppBar(
            backgroundColor: Colors.redAccent,
            title: Text("Animations showcase by Nacho Sierra"),
          ),
          body: snapshot.hasData
              ? AnimatedList(
                  key: animatedListKey,
                  initialItemCount: 0, //snapshot.data.length,
                  itemBuilder: (context, index, animation) {
                    return SlideTransition(
                      position: CurvedAnimation(
                        curve: Curves.easeOut,
                        parent: animation,
                      ).drive(
                        (Tween<Offset>(
                          begin: Offset(1, 0),
                          end: Offset(0, 0),
                        )),
                      ),
                      child: snapshot.data[index],
                    );
                  },
                  shrinkWrap: true,
                  padding: EdgeInsets.all(15.0),
                  // children: snapshot.data,
                )
              : null,
        );
      },
    );
  }

   animateListAfterFetch(BuildContext context) {
    List fetchedList;
    AnimationListElement.getAnimationsFromJson(context)
        .then((v) => fetchedList = v)
        .whenComplete(() {
      List _listItems = List();
      var future = Future(() {});
      for (var i = 0; i < fetchedList.length; i++) {
        future = future.then((_) {
          return Future.delayed(Duration(milliseconds: 100), () {
            _listItems.add(fetchedList[i]);
            animatedListKey.currentState.insertItem(_listItems.length - 1);
          });
        });
      }
    });
  }
}
