import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class TabIconData {
  TabIconData({
    this.icon,
    this.index = 0,
    this.isSelected = false,
    this.animationController,
  });

  IconData icon;
  String selectedImagePath;
  bool isSelected;
  int index;

  AnimationController animationController;

  static List<TabIconData> tabIconsList = <TabIconData>[
    TabIconData(
      icon: FontAwesomeIcons.moneyBillWave,
      index: 0,
      isSelected: true,
      animationController: null,
    ),
    TabIconData(
      icon: FontAwesomeIcons.seedling,
      index: 1,
      isSelected: false,
      animationController: null,
    ),
    TabIconData(
      icon: FontAwesomeIcons.userCircle,
      index: 2,
      isSelected: false,
      animationController: null,
    ),
  ];
}
