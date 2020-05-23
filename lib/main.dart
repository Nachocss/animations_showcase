import 'package:animations/bloc/simple_bloc_delegate.dart';
import 'package:animations/widgets/animation_viewer.dart';
import 'package:animations/widgets/animations_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  BlocSupervisor.delegate = SimpleBlocDelegate();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Animations showcase',
      home: BlocProvider(
        create: (context) => ShowcaseBloc(),
        child: MyHomePage(title: 'HomePage Test animations'),
      ),
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Animations showcase by Nacho Sierra"),
      ),
      body: BlocBuilder<ShowcaseBloc, ShowcaseState>(
        builder: (context, state) {
          if (state is ShowcaseListing) {
            return AnimationList();
          }
          if (state is AnimationPlaying) {
            return SimpleAnimationViewer(
              filename: state.filename,
              animation: state.animationName,
              backgroundColor: state.backgroundColor,
              name: state.name,
            );
          }
        },
      ),
    );
  }
}
