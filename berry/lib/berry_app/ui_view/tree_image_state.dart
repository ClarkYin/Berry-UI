import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TreeImageState extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _TreeImageState();
}

class _TreeImageState extends State<TreeImageState>
    with SingleTickerProviderStateMixin {
  final TextEditingController textController = TextEditingController();
  AnimationController controller;

  @override
  void initState() {
    controller = AnimationController(
        duration: const Duration(milliseconds: 500), vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final Animation<double> offsetAnimation = Tween(begin: 0.0, end: 24.0)
        .chain(CurveTween(curve: Curves.elasticIn))
        .animate(controller)
          ..addStatusListener((status) {
            if (status == AnimationStatus.completed) {
              controller.reverse();
            }
          });

    return Scaffold(
      appBar: AppBar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          AnimatedBuilder(
              animation: offsetAnimation,
              builder: (buildContext, child) {
                if (offsetAnimation.value < 0.0)
                  print('${offsetAnimation.value + 8.0}');
                return Container(
                  margin: EdgeInsets.symmetric(horizontal: 24.0),
                  padding: EdgeInsets.only(
                      left: offsetAnimation.value + 24.0,
                      right: 24.0 - offsetAnimation.value),
                  child: Center(
                      child: TextField(
                    controller: textController,
                  )),
                );
              }),
          RaisedButton(
            onPressed: () {
              if (textController.value.text.isEmpty)
                controller.forward(from: 0.0);
            },
            child: Text('Enter'),
          )
        ],
      ),
    );
  }
}
