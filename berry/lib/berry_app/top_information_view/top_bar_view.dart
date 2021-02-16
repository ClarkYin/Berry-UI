import 'dart:math' as math;
import 'package:berry/berry_app/berry_app_theme.dart';
import 'package:berry/berry_app/models/tabIcon_data.dart';
import 'package:berry/main.dart';
import 'package:flutter/material.dart';

import '../../main.dart';
import '../models/tabIcon_data.dart';

class TopBarView extends StatefulWidget {
  @override
  _TopBarViewState createState() => _TopBarViewState();
}

class _TopBarViewState extends State<TopBarView> with TickerProviderStateMixin {
  AnimationController animationController;

  @override
  void initState() {
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    );
    animationController.forward();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
            color: BerryAppTheme.accent,
            height: 38,
            width: MediaQuery.of(context).size.width,
            child: Row(
              children: <Widget>[
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text('Winners Here'),
                  ),
                )
              ],
            ))
      ],
    );
  }
}
